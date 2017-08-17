require_relative 'game_full.rb'

class Player
  attr_reader :name
  attr_accessor :record

  def initialize(name)
    @name = name
    @record = ""
  end

  def guess
    puts "What is your guess?"
    gets.chomp
  end
end
