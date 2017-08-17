class QuestionLike
  attr_accessor :id, :question_id, :author_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @author_id = options['author_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map {|datum| QuestionLike.new(datum)}
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_likes
    WHERE id = ?
    SQL
    QuestionLike.new(result.first)
  end

  def self.likers_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT users.*
    FROM question_likes
    JOIN users
    ON question_likes.author_id = users.id
    WHERE question_id = ?
    SQL
    result.map {|datum| User.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT COUNT(users.id)
    FROM question_likes
    JOIN users
    ON question_likes.author_id = users.id
    WHERE question_id = ?
    GROUP BY question_id
    SQL
    result.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT questions.*
    FROM question_likes
    JOIN users
    ON question_likes.author_id = users.id
    JOIN questions
    ON question_likes.question_id = questions.id
    WHERE question_likes.author_id = ?
    SQL
    result.map {|datum| Question.new(datum)}
  end

  def most_liked_questions(n)
    result = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.*
      FROM questions
      JOIN question_likes
      ON questions.id = question_likes.question_id
      GROUP BY question
      ORDER BY COUNT(question_likes.id) DESC
      LIMIT ?
    SQL
    result.map {|datum| Question.new(datum)}
  end
end
