require 'sinatra'
require './bad.rb'

get '/' do
  erb :index
end

post '/' do

game = Game.new
  joueur_gagnant = params[:marque] == "Joueur1" ? :joueur1 : :joueur2
  game.point!(joueur_gagnant)
  score_joueur_1 = game.score(:J1)
  score_joueur_2 = game.score(:J2)
  erb :index  
end


