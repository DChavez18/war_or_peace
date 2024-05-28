class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end
end