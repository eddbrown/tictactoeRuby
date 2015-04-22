require 'sinatra'
require_relative 'requirefile.rb'

player_1 = Player.new
player_1.choose(:player_1)
player_2 = Player.new
player_2.choose(:player_2)
checker = Victory_checker.new
board = Board.new
game = Game.new

get '/' do
  player_1.place_piece(board, 2, 2)
  @board = board
  erb :main_page
end

post '/' do
  board.reset!
  redirect '/'
end

post '/place' do
  player_1.place_piece(board, 2, 2)
end
