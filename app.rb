require 'json'
require 'sinatra'
require './lib/game.rb'

get '/' do
   game = Game.new
   @point = game.point
   @data = JSON.parse(File.read("data.json"))
   erb :index
end

post '/' do
    game = Game.new
    game.point!(params[:marque].gsub(/oueur /, '').to_sym)
    @point = game.point
    File.write("data.json", game.point.to_json)
    erb :index

end
