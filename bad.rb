class Game

    def initialize  
        @score = {J1:0, J2:0}
    end 


    def point!(player)

        if player == :J1
            @score[:J1] += 1
        else
            @score[:J2] += 1
        end
    end

    def score
        @score       
    end
end