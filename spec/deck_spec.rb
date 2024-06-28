require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:spade, '10', 10)
    @card3 = Card.new(:diamond, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'can rank cards' do
    expect(@deck.rank_of_card_at(0)).to eq(11)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'can identify high ranking cards' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'can calculate the percentage of high ranking cards' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove a card' do
    @deck.remove_card
    expect(@deck.cards).to eq([@card2, @card3])
  end

  it 'can add a card' do
    card4 = Card.new(:club, '5', 5)
    @deck.add_card(card4)
    expect(@deck.cards).to eq([@card1, @card2, @card3, card4])
  end
end