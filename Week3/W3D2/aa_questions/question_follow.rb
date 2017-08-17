class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map {|datum| QuestionFollow.new(datum)}
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_follows
      WHERE id = ?
    SQL
    QuestionFollow.new(result.first)
  end

  def self.followers_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.*
      FROM question_follows
      JOIN users
      ON question_follows.user_id = users.id
      WHERE question_id = ?
    SQL
    result.map {|datum| User.new(datum)}
  end

  def self.followed_questions_for_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.*
      FROM question_follows
      JOIN questions
      ON question_follows.question_id = questions.id
      WHERE user_id = ?
    SQL
    result.map {|datum| Question.new(datum)}
  end

  def self.most_followed_questions(n)
  result = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT questions.*
    FROM questions
    JOIN question_follows
    ON questions.id = questionfollows.question_id
    GROUP BY question
    ORDER BY COUNT(questionfollows.id) DESC
    LIMIT ?
  SQL
  result.map {|datum| Question.new(datum)}
  end
end
