class Game

    attr_reader :point, :set

    def initialize
        @point = {J1:0, J2:0}
        @set = {J1:0, J2:0}
    end

    def point!(player)        
        @point[player] += 1

        if @point[player] == 21
            @point = {J1:0, J2:0}
            @set[player]+=1
        end
    end   
end