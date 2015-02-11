require 'redis'

class Game

    def initialize
        @redis = Redis.new
    end

    def point
        point_j1 = @redis.get("bad:point_J1")
        point_j2 = @redis.get("bad:point_J2")
        {J1: point_j1, J2: point_j2}
    end

    def set
        set_j1 = @redis.get("bad:set_J1")
        set_j2 = @redis.get("bad:set_J2")
        {J1: set_j1, J2: set_j2}
    end

    def reset(marque)
        @redis.set("bad:#{marque}_J1", 0)
        @redis.set("bad:#{marque}_J2", 0)
    end

    def restart_match
        game.reset("point")
        game.reset("set")
    end

    def point!(player)        
        @redis.incr("bad:point_#{player}")
        if set_win?(player) 
            reset("point")
            @redis.incr("bad:set_#{player}")
        end
    end

    def other_player(player)
        player == :J2 ? :J1 : :J2       
    end

    def set_win?(player)
        point_player = @redis.get("bad:point_#{player}").to_i
        point_other_player = @redis.get("bad:player_#{other_player(player)}").to_i
        point_player == 30 ||          
        point_player >= 21 && 
        point_player - point_other_player >= 2
    end

end
   