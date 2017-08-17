require 'game.rb'
require 'card.rb'
require 'player.rb'
require 'deck.rb'
require 'hand.rb'
require 'rspec'

describe "game" do
  subject(:game) {Game.new(["Mike", "Priya"])}
  describe "#initialize" do
    it "creates a new deck" do
      expect(game.deck).to be_truthy
    end
    it "accepts an array of player name" do
      expect(game.player_names).to be_a(Array)
    end
  end
  # describe "#make_players" do
  #   it "creates an array of player objects" do
  #     expect(game.make_players(game.player_names.)).to be_a(Player)
  #   end
  # end

end

describe "card" do
  subject(:card) {Card.new("8", "Diamonds")}
  describe "#initialize" do
    it "creates a new card with number" do
      expect(card.number).to eq("8")
    end
    it "creates a new card with suit" do
      expect(card.suit).to eq("Diamonds")
    end
  end
end

  describe "deck" do
    subject(:deck) {Deck.new}
    describe "#initialize" do
      it "creates a deck of 52 cards" do
        expect(deck.cards.length).to eq(52)
      end
    end

    describe "#shuffle_cards" do
      it "shuffles the deck" do
        expect(deck.shuffle_cards).to_not eq(deck.cards)
      end
    end

    describe "#count" do
      it "counts the number of cards" do
        expect(deck.count).to eq(52)
      end
    end

    describe "#take cards" do
      it "remove x number of cards from the deck" do
        deck.take_cards(5)
        expect(deck.count).to eq(47)
      end
    end
  end

describe "hand" do
  subject(:hand) {Hand.new([["A","Diamond"],["A","Heart"],["Q","Heart"],["A","Club"],["4","Spade"]])}
  describe "#initialize" do
    it "creates a hand of 5 cards" do
      expect(hand.player_hand.length).to eq(5)
    end
  end
end

describe "player" do
  let (:deck) {double (:Deck)}
  subject(:phoebe)  {Player.new("Phoebe", deck)}
  describe "#initialize" do
    it "initializes with a name" do
      allow(deck).to receive(:take_cards).and_return([1,2,3,4,5])
      expect(phoebe.name).to eq("Phoebe")
    end
    # it "initializes with a hand of 5 cards" do
    #   allow(deck).to receive(:deal_five).and_return([1,2,3,4,5])
    #   expect(phoebe.hand.length).to eq(5)
    # end
  end
end
