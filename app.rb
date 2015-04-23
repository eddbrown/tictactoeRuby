require 'sinatra'
require 'json'
require_relative 'requirefile.rb'

player_1 = Player.new
player_1.choose(:player_1)
player_2 = Player.new
player_2.choose(:player_2)
checker = Victory_checker.new
board = Board.new
game = Game.new

get '/' do
  @status = checker.check(board.grid)
  @game = game
  @board = board
  erb :main_page
end

get '/reset' do
  board.reset!
  game.reset!
  redirect '/'
end

post '/place' do
  if game.turn_count % 2 != 0
    player_1.place_piece(board, params['coords'][0].to_i, params['coords'][0].to_i)
    piece = player_1.piece
  else
    player_2.place_piece(board, params['coords'][0].to_i, params['coords'][0].to_i)
    piece = player_2.piece
  end
  game.update_turn
  p checker.check(board.grid)
  { gameStatus: checker.check(board.grid), piece: piece}.to_json
end
 