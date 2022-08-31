# frozen_string_literal: true

class TicTacToe
  @game_board = %w[1 2 3 4 5 6 7 8 9]

  def display_welcome_message
    'Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n'
  end

  def display_instructions
    "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
    "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
    "Choose numbers 1-9 to select your spot on the board\n\n"
  end

  def display_game_board(game_board)
    horizontal_board_line = '----------'
    game_board.each do |i|
      print game_board[i - 1] if (i % 3) == 1
      if (i % 3) == 2
        print ' | '
        print game_board[i - 1]
        print ' | '
      end
      next unless (i % 3).zero?
      print game_board[i - 1]
      print "\n"
      puts horizontal_board_line
    end
  end

  def request_player_selection(which_player)
    puts "Player " + which_player + ", please choose an integer between 1 and 9."
    player_selection = gets.to.i
    if !(player_selection >= 1 && player_selection <= 9)
      puts "Error: not an integer between 1 and 5. Please choose again."
      request_player_selection
    elsif check_game_board(game_board, player_selection) == true
      puts "Player " + which_player + ", has selected: " + player_selection
      player_selection
    else
      puts "Error: already selected. Please choose again."
      request_player_selection
    end
  end

  def check_game_board(game_board, player_selection)
    if game_board[player_selection - 1] == 'X'
      false
    elsif game_board[player_selection - 1] == 'O'
      false
    else
      true
    end
  end

  def mark_game_board(game_board, player_selection, which_player)
    if which_player == 'X'
      game_board[player_selection - 1] = 'X'
    else
      game_board[player_selection - 1] = 'O'
    end
  end
end

