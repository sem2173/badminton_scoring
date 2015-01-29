require './bad'

describe 'Badminton Score'do
    let(:game) {game = Game.new}
    it "no begin set no score"do
    expect(game.score).to eq({J1:0, J2:0})    
    end

    it " J1 scores 1 point"do
    game.point!(:J1)
    expect(game.score).to eq({J1:1, J2:0})    
    end

    it " J2 scores 1 point"do
    game.point!(:J2)
    expect(game.score).to eq({J1:0, J2:1})
    end 

    it " J1 scores 1 point and J2 scores 1 point"do
    game.point!(:J1)
    game.point!(:J2)
    expect(game.score).to eq({J1:1, J2:1})
    end
end