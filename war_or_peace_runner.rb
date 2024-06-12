require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

cards = [
  Card.new(:heart, '2', 2),
  Card.new(:heart, '3', 3),
  Card.new(:heart, '4', 4),
  Card.new(:heart, '5', 5),
  Card.new(:heart, '6', 6),
  Card.new(:heart, '7', 7),
  Card.new(:heart, '8', 8),
  Card.new(:heart, '9', 9),
  Card.new(:heart, '10', 10),
  Card.new(:heart, 'Jack', 11),
  Card.new(:heart, 'Queen', 12),
  Card.new(:heart, 'King', 13),
  Card.new(:heart, 'Ace', 14),
  Card.new(:diamond, '2', 2),
  Card.new(:diamond, '3', 3),
  Card.new(:diamond, '4', 4),
  Card.new(:diamond, '5', 5),
  Card.new(:diamond, '6', 6),
  Card.new(:diamond, '7', 7),
  Card.new(:diamond, '8', 8),
  Card.new(:diamond, '9', 9),
  Card.new(:diamond, '10', 10),
  Card.new(:diamond, 'Jack', 11),
  Card.new(:diamond, 'Queen', 12),
  Card.new(:diamond, 'King', 13),
  Card.new(:diamond, 'Ace', 14),
  Card.new(:club, '2', 2),
  Card.new(:club, '3', 3),
  Card.new(:club, '4', 4),
  Card.new(:club, '5', 5),
  Card.new(:club, '6', 6),
  Card.new(:club, '7', 7),
  Card.new(:club, '8', 8),
  Card.new(:club, '9', 9),
  Card.new(:club, '10', 10),
  Card.new(:club, 'Jack', 11),
  Card.new(:club, 'Queen', 12),
  Card.new(:club, 'King', 13),
  Card.new(:club, 'Ace', 14),
  Card.new(:spade, '2', 2),
  Card.new(:spade, '3', 3),
  Card.new(:spade, '4', 4),
  Card.new(:spade, '5', 5),
  Card.new(:spade, '6', 6),
  Card.new(:spade, '7', 7),
  Card.new(:spade, '8', 8),
  Card.new(:spade, '9', 9),
  Card.new(:spade, '10', 10),
  Card.new(:spade, 'Jack', 11),
  Card.new(:spade, 'Queen', 12),
  Card.new(:spade, 'King', 13),
  Card.new(:spade, 'Ace', 14)
]

shuffled_cards = cards.shuffle

deck1 = Deck.new(shuffled_cards[0..25])
deck2 = Deck.new(shuffled_cards[26..51])

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "Enter the name for player 1:"
player1 = Player.new(gets.chomp, deck1)
puts "Enter the name for player 2:"
player2 = Player.new(gets.chomp, deck2)

turn_count = 1

loop do
  turn = Turn.new(player1, player2)
  puts "Turn #{turn_count}: #{turn.type}"
  turn.pile_cards
  puts "Player 1 drew #{turn.player1.deck.cards.last.rank} of #{turn.player1.deck.cards.last.suit}"
  puts "Player 2 drew #{turn.player2.deck.cards.last.rank} of #{turn.player2.deck.cards.last.suit}"
  puts turn.winner
  turn.award_spoils(turn.winner)
  puts "Player 1 has #{player1.deck.cards.count} cards left"
  puts "Player 2 has #{player2.deck.cards.count} cards left"
  turn_count += 1
  break if player1.has_lost? || player2.has_lost?
  
  if turn_count > 1000000
    puts "---- DRAW ----"
  elsif player1.has_lost?
    puts "Player 2 wins!"
  else
    puts "Player 1 wins!"
  end
end


