require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Player do
  it "exists" do
    player = Player.new('Clarisa', 'deck')

    expect(player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    player = Player.new('Clarisa', 'deck')

    expect(player.name).to eq('Clarisa')
    expect(player.deck).to eq('deck')
  end

  it "can determine if player has lost" do
    deck = Deck.new
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq(true)
  end
end