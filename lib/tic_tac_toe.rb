
class Game

    game_board = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]

    def create_welcome_message
        message = "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
        puts message
        message
    end

    def display_instructions
        instructions = "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" +
        "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" +
        "Choose numbers 1-9 to select your spot on the board\n\n";
        puts instructions
        instructions  
    end

    def display_game_board(game_board)  
        puts game_board.to_a.map(&:inspect)
        game_board
    end 

    def get_player_x_selection
        puts "Player 1 AKA 'X' - Choose an integer between 1-9 to place your 'X' on the board"
        player_x_selection = gets.to_i
            if !(player_x_selection >= 1 && player_x_selection <=9)
                puts "Incorrect selection, please select a number between 1-9"
                get_player_x_selection
            else
                print "Player X selected position: "
                puts player_x_selection
                player_x_selection
            end        
    end

    def mark_game_board(game_board, get_player_x_selection)        
        if get_player_x_selection == 1
            game_board[0][0] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[0][0]
        elsif
            get_player_x_selection == 2
            game_board[0][1] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[0][1]
        elsif
            get_player_x_selection == 3
            game_board[0][2] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[0][2]
        elsif
            get_player_x_selection == 4
            game_board[1][0] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[1][0]
        elsif
            get_player_x_selection == 5
            game_board[1][1] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[1][1]
        elsif
            get_player_x_selection == 6
            game_board[1][2] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[1][2]
        elsif
            get_player_x_selection == 7
            game_board[2][0] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[2][0]
        elsif
            get_player_x_selection == 8
            game_board[2][1] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[2][1]
        else
            get_player_x_selection == 9
            game_board[2][2] = "X"
            puts game_board.to_a.map(&:inspect)
            game_board[2][2]
        end
    end
end

NewGame = Game.new

