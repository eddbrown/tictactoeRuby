require 'sinatra'
require_relative 'requirefile.rb'

ed = Player.new
bob = Player.new
checker = Victory_checker.new
board = Board.new
game = Game.new

get '/' do
  board.place(:x, 0, 0)
  board.place(:o, 1, 1)
  @board = board
  erb :main_page
end