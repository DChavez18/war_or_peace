require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Turn do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:spade, '10', 10)
    @card3 = Card.new(:diamond, 'Ace', 14)
    @card4 = Card.new(:club, '3', 3)
    @cards1 = [@card1, @card2, @card3, @card4]
    @cards2 = [@card4, @card3, @card2, @card1]
    @deck1 = Deck.new(@cards1)
    @deck2 = Deck.new(@cards2)
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it "exists" do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "has readable attributes" do
    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
    expect(@turn.spoils_of_war).to eq([])
  end

  it "can determine type" do
    expect(@turn.type).to eq(:basic)
  end

  it "can determine winner" do
    expect(@turn.winner).to eq(@player1)
  end

  it "can award spoils" do
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)
    expect(@player2.deck.cards).to include(@card1, @card2, @card3, @card4)
  end

  it "can pile cards" do
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([@card1, @card4])
  end
end