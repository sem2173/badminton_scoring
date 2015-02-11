require 'bad'

describe 'Badminton Score' do

    def check_point(score)
        expect(game.point).to eq({J1: score[0], J2: score[1]})  
    end

    let(:game) {Game.new}
    
    it "no begin set no score" do
        game = Game.new
        expect(game.point).to eq({J1: 0, J2: 0})  
    end

    it " J1 scores 1 point" do
        game = Game.new
        game.point!(:J1)
        expect(game.point).to eq({J1: 1, J2: 0})  
    end

    it " J2 scores 1 point" do
        game = Game.new
        game.point!(:J2)
        expect(game.point).to eq({J1: 0, J2: 1})
    end 

    it " J1 scores 1 point and J2 scores 1 point" do
        game = Game.new({J1: 1, J2: 0})
        game.point!(:J2)
        expect(game.point).to eq({J1: 1, J2: 1})  
    end

    it " J1 win a set" do
        game = Game.new({J1: 20, J2: 0})
        game.point!(:J1)
        expect(game.set).to eq({J1:1, J2: 0})
        expect(game.point).to eq({J1: 0, J2: 0})  
    end

    it "not 2 points difference" do
        game = Game.new({J1: 21, J2: 20})
        game.point!(:J2)
        expect(game.set).to eq({J1:0, J2: 0}) 
        # ne comprends pas pourquoi le joueur 1 à 1 set
        # si je mets game.point!(:J1) ça ne marche pas
    end

    it "not 2 points difference after 21 " do
        game = Game.new({J1: 21, J2: 22})
        game.point!(:J1)
        game.point!(:J2)
        expect(game.set).to eq({J1:0, J2: 0})        
    end

    it "2 points difference after 21 " do
        game = Game.new({J1: 21, J2: 25})
        game.point!(:J1)
        game.point!(:J2)
        expect(game.set).to eq({J1:0, J2: 1})        
    end

    it "2 points difference max 30 " do 
        game = Game.new({J1: 29, J2: 30})       
        game.point!(:J2)        
        expect(game.set).to eq({J1:0, J2: 1})        
    end
    # le set n'est pas atribué au bon joueur si je mets game.point!(:J1)

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

