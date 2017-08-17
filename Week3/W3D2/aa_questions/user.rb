
class User
  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    User.new(result.first)
  end

  def self.find_by_name(fname, lname)
    result = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL
    User.new(result.first)
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT(questions.id))
      FROM questions
      LEFT OUTER JOIN question_likes
      ON questions.id = question_likes.question_id
      WHERE questions.author_id = ?
      GROUP BY questions.author_id
    SQL
    result.first.values.first
  end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        INSERT INTO users(fname, lname)
        VALUES (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, fname, lname, id)
        UPDATE
          users
        SET
          fname=?, lname=?
        WHERE
          id = ?
      SQL
    end
  end
end
