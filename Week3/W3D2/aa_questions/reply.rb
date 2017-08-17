class Reply
  attr_accessor :id, :question_id, :parent_id, :author_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    Reply.new(result.first)
  end

  def self.find_by_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE author_id = ?
    SQL
    result.map {|datum| Reply.new(datum)}
  end

  def self.find_by_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
    result.map {|datum| Reply.new(datum)}
  end

  def author
    User.find_by_id(@author_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    @parent_id ? Reply.find_by_id(@parent_id) : self
  end

  def child_replies
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id, id)
      SELECT *
      FROM replies
      WHERE question_id = ? AND id > ?
      LIMIT 1
    SQL
    result.map {|datum| Reply.new(datum)}
  end
end
