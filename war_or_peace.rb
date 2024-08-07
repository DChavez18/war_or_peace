require 'sinatra'
require './lib/turn'

set :public_folder, 'public'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

# Start a new game
post '/start_game' do
  game = Game.new(params[:player1_name], params[:player2_name])
  game.to_json # Send the initial game state to the client
end

# Handle a turn
post '/next_turn' do
  game = Game.load(params[:game_id]) # Load the game state
  game.play_turn
  game.to_json # Send the updated game state to the client
end