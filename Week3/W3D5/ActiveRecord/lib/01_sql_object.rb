require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @alldata ||= DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    @columns ||= @alldata.first.map! {|el| el.to_sym}
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do
        attributes[column]
      end
      define_method("#{column}=") do |value|
        attributes[column] = value
      end
    end

  end

  def self.table_name=(table_name)
      @table_name = table_name
  end

  def self.table_name
      @table_name ||= self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT #{self.table_name}.*
      FROM #{self.table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |instance|
      self.new(instance)
    end

  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{self.table_name}
      WHERE id = ?
    SQL
    return nil if results.empty?
    return self.new(results.first)
  end

  def initialize(params = {})
    params.keys.each do |attr_name|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
    send("#{attr_name}=", params[attr_name])
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    col_names = self.class.columns[1..-1].join(",")
    n = (self.class.columns.length) -1
    question_marks = (["?"] * n).join(",")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO #{self.class.table_name} (#{col_names})
      VALUES (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns[1..-1].map! {|col| "#{col} = ?"}
    set_line = set_line.join(", ")
    p set_line
    p attribute_values
    DBConnection.execute(<<-SQL, *attribute_values[1..-1], id)
      UPDATE #{self.class.table_name}
      SET #{set_line}
      WHERE #{self.class.table_name}.id = ?
    SQL

  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end
end
