require_relative '../lib/tic_tac_toe'

describe Game do

    it "should display a welcome message when the game is started" do
        TestGame = Game.new
        expect(TestGame.create_welcome_message).to eql "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
    end 

    it "should contain a 3x3 matrix to act as the game board" do
        expect(TestGame.create_game_board).to eql [
                                                [1, 2, 3],
                                                [4, 5, 6],
                                                [7, 8, 9]
                                                ]
    end

    it "should display simple instructions explaining how to play when the game is started" do
        expect(TestGame.display_instructions).to eql "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" +
                                                    "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" +
                                                    "Choose numbers 1-9 to select your spot on the board\n\n";
    end

    it "should request an integer between 1-9 from the human player" do
        

    end
end 


