require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    deck = Deck.new

    expect(deck.cards).to eq([])
  end

  it "can rank cards" do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.cards << card1
    deck.cards << card2
    deck.cards << card3

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(1)).to eq(3)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "can find high ranking cards" do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.cards << card1
    deck.cards << card2
    deck.cards << card3

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "can find percent high ranking" do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.cards << card1
    deck.cards << card2
    deck.cards << card3

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove a card" do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.cards << card1
    deck.cards << card2
    deck.cards << card3
    deck.remove_card

    expect(deck.cards).to eq([card2, card3])
  end

  it "can add a card" do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.cards << card1
    deck.cards << card2
    deck.cards << card3
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    expect(deck.cards).to eq([card1, card2, card3, card4])
  end
end