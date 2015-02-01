require './bad'

describe 'Badminton Score'do

    def check_score(score)
        new_score = {J1: score[0], J2: score[1]}
        expect(game.score).to eq(new_score)  
    end

    let(:game) {Game.new}
    
    it "no begin set no score"do
        check_score([0,0])    
    end

    it " J1 scores 1 point"do
        game.point!(:J1)
        check_score([1,0])    
    end

    it " J2 scores 1 point"do
        game.point!(:J2)
        check_score([0,1])
    end 

    it " J1 scores 1 point and J2 scores 1 point"do
        game.point!(:J1)
        game.point!(:J2)
        check_score([1,1])
    end

    it " J1 win a set"do
        21.times { game.point!(:J1) }
        new_set = {J1: 1, J2: 0}
        expect(game.set).to eq(new_set)
        check_score([1,0])
    end
end