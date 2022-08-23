
class Game
    def createWelcomeMessage
        message = "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
    end

    def createGameBoard
        board = [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]
                ]
    end

    def displayInstructions
        instructions = "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" +
        "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" +
        "Choose numbers 1-9 to select your spot on the board\n\n";  
    end
end

newGame = Game.new
puts newGame.createWelcomeMessage
puts newGame.displayInstructions

