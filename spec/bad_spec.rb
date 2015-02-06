require 'bad'

describe 'Badminton Score' do

    def check_point(score)
        new_score = {J1: score[0], J2: score[1]}
        expect(game.point).to eq(new_score)  
    end

    let(:game) {Game.new}
    
    it "no begin set no score" do
        check_point([0,0])    
    end

    it " J1 scores 1 point" do
        game.point!(:J1)
        check_point([1,0])    
    end

    it " J2 scores 1 point" do
        game.point!(:J2)
        check_point([0,1])
    end 

    it " J1 scores 1 point and J2 scores 1 point" do
        game.point!(:J1)
        game.point!(:J2)
        check_point([1,1])
    end

    it " J1 win a set" do
        21.times { game.point!(:J1) }
        new_set = {J1:1, J2: 0}
        expect(game.set).to eq(new_set)
        check_point([0,0])
    end

    it "not 2 points difference" do
        20.times {game.point!(:J2)}
        21.times {game.point!(:J1)}
        expect(game.set).to eq({J1:0, J2: 0})
        check_point([21,20])
    end

    it "not 2 points difference after 21 " do
        20.times {game.point!(:J2)}
        21.times {game.point!(:J1)}
        2.times {game.point!(:J2)}
        expect(game.set).to eq({J1:0, J2: 0})
        check_point([21,22])
    end

    it "2 points difference after 21 " do
        20.times {game.point!(:J2)}
        21.times {game.point!(:J1)}
        3.times {game.point!(:J2)}
        expect(game.set).to eq({J1:0, J2: 1})
        check_point([0,0])
    end

    it "2 points difference max 30 " do        
        20.times {game.point!(:J2)}
        21.times {game.point!(:J1)}
        2.times {game.point!(:J2)}
        2.times {game.point!(:J1)}
        2.times {game.point!(:J2)}
        2.times {game.point!(:J1)}
        2.times {game.point!(:J2)}
        2.times {game.point!(:J1)}
        2.times {game.point!(:J2)}
        2.times {game.point!(:J1)}
        2.times {game.point!(:J2)}
        expect(game.set).to eq({J1:0, J2: 1})
        check_point([0,0])
    end
    it "player win two sets and win the match " do        
        18.times {game.point!(:J2)}
        21.times {game.point!(:J1)}
        6.times {game.point!(:J2)}
        21.times {game.point!(:J1)}
        1.times {game.point!(:J1)}
        expect(game.current_match).to eq("message")
        check_point([0,0])
    end

    it "other player" do
        expect(game.other_player(:J1)).to eq(:J2)
        expect(game.other_player(:J2)).to eq(:J1)
    end
end
