class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      if player1.deck.cards.size > 2 && player2.deck.cards.size > 2 && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      else
        :war
      end
    else
      :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    return if winner == "No Winner"
    
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
    @spoils_of_war = []
  end
end