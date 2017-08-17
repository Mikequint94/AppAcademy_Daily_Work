require 'sqlite3'
require 'singleton'
require_relative 'question'
require_relative 'user'
require_relative 'question_follow'
require_relative 'reply'
require_relative 'question_like'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end


load 'question.rb'
load 'user.rb'
load 'question_follow.rb'
load 'reply.rb'
load 'question_like.rb'
