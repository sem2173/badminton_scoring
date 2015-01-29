class Game

attr_reader :score

    def initialize  
        @score = {J1:0, J2:0}
    end 


    def point!(player)
        @score[player] += 1       
    end    
end