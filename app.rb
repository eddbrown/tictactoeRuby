require 'sinatra'
require 'json'
require_relative 'requirefile.rb'

player = Player.new
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
  checker.reset!
  redirect '/'
end

post '/place' do
  if player.place_piece(checker, game, board, params['coords'][0].to_i, params['coords'][1].to_i)
    { gameStatus: checker.check(board.grid), piece: player.piece}.to_json
  else
    { gameStatus: checker.check(board.grid), instruction: 'dont update' }.to_json
  end
end
 