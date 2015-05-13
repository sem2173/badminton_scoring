require 'sinatra'
require './lib/game.rb'
require 'json'

get '/' do
   game = Game.new
   @point = game.point
   erb :index
end

post '/' do
    game = Game.new
    count = JSON.parse(game.point!(params[:marque].gsub(/oueur /, '').to_sym))
    @point = game.point
    erb :index
    return @point.to_json
end
