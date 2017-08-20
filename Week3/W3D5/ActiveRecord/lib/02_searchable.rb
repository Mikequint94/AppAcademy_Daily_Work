require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    keys = params.keys.map! {|key| key.to_s}
    keys.map! {|key| "#{key} = ? AND "}
    keys = keys.join("")[0..-6]
    p keys
    vals = params.values
    p vals
    results = DBConnection.execute(<<-SQL, vals)
      SELECT *
      FROM #{self.table_name}
      WHERE #{keys}
    SQL
    parse_all(results)
  end
end

class SQLObject
  extend Searchable
end
