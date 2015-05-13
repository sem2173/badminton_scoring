require 'sinatra'
require './lib/game.rb'

get '/' do
   game = Game.new
   @point = game.point
   erb :index
end

post '/' do
    game = Game.new
    game.point!(params[:marque].gsub(/oueur /, '').to_sym)
    @point = game.point
    erb :index
end
