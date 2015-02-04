class Game

    attr_reader :point, :set

    def initialize
        @point = {J1:0, J2:0}
        @set = {J1:0, J2:0}
    end

    def point!(player)
        @point[player] += 1
    end

    def set
        @point = {J1:0, J2:0}
        {J1:1, J2: 0}
    end
end