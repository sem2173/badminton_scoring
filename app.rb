require 'sinatra'
require './lib/bad.rb'

get '/' do
    game = Game.new
    @point = game.point
    @set = game.set
    erb :index
end

post '/' do
    game = Game.new
    game.point!(params[:marque].gsub(/oueur /, '').to_sym)
    @point = game.point
    @set = game.set
    erb :index  
end

post '/reset_game' do
  Game.new.restart_match
  redirect to('/')
end
