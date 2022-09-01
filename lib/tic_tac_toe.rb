# frozen_string_literal: true

class TicTacToe
  def initialize
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
  end

  def display_instructions
    puts "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
         "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
         "Choose numbers 1-9 to select your spot on the board\n\n"
  end

  def display_game_board
    horizontal_board_line = '---------'
    @game_board.each_index do |i|
      if (i % 3) == 0
        print @game_board[i]
      elsif (i % 3) == 1
        print ' | '
        print @game_board[i]
        print ' | '
      elsif (i % 3) == 2
        print @game_board[i]
        print "\n"
        puts horizontal_board_line
      end
    end
  end

  def request_player_selection(which_player)
    puts 'Player ' + which_player + ', please choose an integer between 1 and 9.'
    player_selection = gets.to_i
    if (player_selection >= 1 && player_selection <= 9) == false
      puts 'Error: not an integer between 1 and 5. Please choose again.'
      request_player_selection(which_player)
    elsif is_position_available?(player_selection) == true
      puts 'Player ' + which_player + ', has selected: ' + player_selection.to_s
      player_selection
    else
      puts 'Error: already selected. Please choose again.'
      request_player_selection(which_player)
    end
  end

  def is_position_available?(player_selection)
    available_positions.include? player_selection
  end

  def mark_game_board(which_player, player_selection)
    @game_board[player_selection - 1] = if which_player == 'X'
                                          'X'
                                        else
                                          'O'
                                        end
  end

  def available_positions
    @game_board.select { |pos| pos != 'X' }
  end

  def get_game_board
    @game_board
  end
end
