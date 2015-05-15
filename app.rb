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
    count = game.point!(params[:marque].gsub(/oueur /, '').to_sym)
    @point = game.point
    values = JSON.parse(@point.to_json)
    File.open('data.json', 'w'){|file| file.write(values)}
    erb :index

end
