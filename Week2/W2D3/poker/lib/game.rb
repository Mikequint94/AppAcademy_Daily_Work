require 'deck'
require 'player'

class Game

  attr_reader :player_names, :deck

  def initialize(player_names)
    @deck = Deck.new
    @player_names = player_names
    make_players(@player_names)
  end

  def make_players(player_names)
    @players = []
    player_names.each do |player|
      @players << Player.new(player, @deck)
    end
    @players
  end

  def run

  end

  def play

  end

end
