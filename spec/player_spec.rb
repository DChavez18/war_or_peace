require './lib/player'
require './lib/deck'
require './lib/card'

Rspec.describe Player do
  it "exists" do
    player = Player.new("Clarisa", deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    player = Player.new("Clarisa", deck)

    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
  end

  it "can determine if player has lost" do
    player = Player.new("Clarisa", deck)
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.cards << card1
    deck.cards << card2
    deck.cards << card3

    expect(player.has_lost?).to eq(false)

    deck.remove_card
    deck.remove_card
    deck.remove_card

    expect(player.has_lost?).to eq(true)
  end
end