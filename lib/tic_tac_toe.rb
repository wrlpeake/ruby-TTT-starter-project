
class Game
    def create_welcome_message
        message = "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
    end

    def create_game_board
        board = [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]
                ]
    end

    def display_instructions
        instructions = "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" +
        "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" +
        "Choose numbers 1-9 to select your spot on the board\n\n";  
    end
end

NewGame = Game.new
puts NewGame.create_welcome_message
puts NewGame.display_instructions
puts NewGame.create_game_board.to_a.map(&:inspect)


