require_relative '../lib/tic-tac-toe'

describe Game do

    it "has a passing test" do
        expect(true).to be true
    end

    it "should display a welcome message when the game is started" do
        testGame = Game.new
        expect(testGame.createWelcomeMessage).to eql "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)"
    end 
end 