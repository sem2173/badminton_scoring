class Game

    attr_reader :point, :set

    def initialize
        @point = {J1:0, J2:0}
        @set = {J1:0, J2:0}
    end

    def point!(player)

        return "message" if @set.values.max >= 2

        @point[player] += 1

        if set_win?(player)
            @point = {J1:0, J2:0}
            @set[player] += 1
        end
    end

    def current_match

        return "message"   if @set.values.max >= 2
    end

    def other_player(player)
        player == :J2 ? :J1 : :J2
    end

    private

    def set_win?(player)

        @point[player] == 30 ||
        @point[player] >= 21 &&
        @point[player] - @point[other_player(player)] >= 2
    end

end
