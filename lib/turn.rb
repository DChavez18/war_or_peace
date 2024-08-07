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
      elsif player1.deck.cards.size < 3 || player2.deck.cards.size < 3
        :basic  # fallback to basic if not enough cards for war
      else
        :war
      end
    else
      :basic
    end
  end

  def winner
    if type == :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      if player1.deck.cards.size > 2 && player2.deck.cards.size > 2
        player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
      else
        # If not enough cards to complete the war, declare winner based on remaining cards
        player1.deck.cards.size > player2.deck.cards.size ? player1 : player2
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
        @spoils_of_war << player1.deck.remove_card if player1.deck.cards.any?
        @spoils_of_war << player2.deck.remove_card if player2.deck.cards.any?
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card if player1.deck.cards.any?
        player2.deck.remove_card if player2.deck.cards.any?
      end
    end
  end

  def award_spoils(winner)
    return if winner == "No Winner"

    winner.deck.cards.concat(@spoils_of_war)
    @spoils_of_war.clear
  end
end