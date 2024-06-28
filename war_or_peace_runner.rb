require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# Create the deck and shuffle it
cards = []
[:heart, :spade, :diamond, :club].each do |suit|
  (2..14).each do |rank|
    value = case rank
            when 11 then 'Jack'
            when 12 then 'Queen'
            when 13 then 'King'
            when 14 then 'Ace'
            else rank.to_s
            end
    cards << Card.new(suit, value, rank)
  end
end

deck = Deck.new(cards.shuffle)

# Split the deck into two halves for two players
deck1 = Deck.new(deck.cards[0..25])
deck2 = Deck.new(deck.cards[26..51])

# Initialize players
puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "Enter the name for player 1:"
player1_name = gets.chomp
puts "Enter the name for player 2:"
player2_name = gets.chomp

player1 = Player.new(player1_name, deck1)
player2 = Player.new(player2_name, deck2)

turn_count = 1
max_turns = 1000  # Maximum number of turns to prevent infinite loop

loop do
  break if player1.has_lost? || player2.has_lost? || turn_count > max_turns

  turn = Turn.new(player1, player2)
  puts "Turn #{turn_count}: #{turn.type}"

  if turn.type == :basic
    puts "Player 1 drew #{turn.player1.deck.cards[0].rank} of #{turn.player1.deck.cards[0].suit}"
    puts "Player 2 drew #{turn.player2.deck.cards[0].rank} of #{turn.player2.deck.cards[0].suit}"
  elsif turn.type == :war
    if player1.deck.cards.size > 2 && player2.deck.cards.size > 2
      puts "Player 1 drew #{turn.player1.deck.cards[2].rank} of #{turn.player1.deck.cards[2].suit}"
      puts "Player 2 drew #{turn.player2.deck.cards[2].rank} of #{turn.player2.deck.cards[2].suit}"
    else
      puts "Not enough cards for war"
    end
  end

  winner = turn.winner
  if winner == "No Winner"
    puts "No Winner this turn"
  else
    puts "#{winner.name} wins!"
  end

  turn.pile_cards
  turn.award_spoils(winner) unless winner == "No Winner"

  puts "Player 1 has #{player1.deck.cards.count} cards left"
  puts "Player 2 has #{player2.deck.cards.count} cards left"

  turn_count += 1
end

if player1.has_lost?
  puts "#{player1.name} has lost the game!"
elsif player2.has_lost?
  puts "#{player2.name} has lost the game!"
else
  puts "Game reached maximum turns without a winner."
end


