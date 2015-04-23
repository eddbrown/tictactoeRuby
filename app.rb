require 'sinatra'
require 'json'
require_relative 'requirefile.rb'

player_1 = Player.new
player_1.choose(:player_1)
player_2 = Player.new
player_2.choose(:player_2)
checker = VictoryChecker.new
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
    if player_1.place_piece(game, board, params['coords'][0].to_i, params['coords'][1].to_i)
      piece = player_1.piece
      { gameStatus: checker.check(board.grid), piece: piece}.to_json
    else
      { gameStatus: checker.check(board.grid), instruction: 'dont update' }.to_json
    end
  else
    if player_2.place_piece(game, board, params['coords'][0].to_i, params['coords'][1].to_i)
      piece = player_2.piece
      { gameStatus: checker.check(board.grid), piece: piece}.to_json
    else
      { gameStatus: checker.check(board.grid), instruction: 'dont update' }.to_json
    end
  end
  
end
 