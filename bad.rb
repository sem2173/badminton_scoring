class Game

    def initialize  
        @score = {J1:0, J2:0}
    end 


    def point!(player)

        if player == :J2
            @score = {J1:0, J2:1}
        else
            @score = {J1:1, J2:0}
        end
    end

    def score
    @score       
    end
end