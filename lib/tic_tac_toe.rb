# frozen_string_literal: true

require_relative 'board'

class TicTacToe
  def initialize(board: Board)
    @board = board.new
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n"
  end

  def display_instructions
    puts "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
         "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
         "Choose numbers 1-9 to select your spot on the board\n\n"
  end

  def request_player_selection(player)
    puts "\nPlayer #{player}, please choose an integer between 1 and 9.\n"
    position = gets.to_i
    if (position >= 1 && position <= 9) == false
      puts "\nError: not an integer between 1 and 9. Please choose again\n."
      request_player_selection(player)
    elsif @board.position_available?(position) == false
      puts "\nError: already selected. Please choose again.\n"
      request_player_selection(player)
    else
      puts "\nPlayer #{player}, has selected: #{position}\n\n"
      position
    end
  end

  def display_game_board
    game_board = @board.get_game_board
    horizontal_board_line = '---------'
    game_board.each_index do |i|
      if (i % 3).zero?
        print game_board[i]
      elsif (i % 3) == 1
        print ' | '
        print game_board[i]
        print ' | '
      elsif (i % 3) == 2
        print game_board[i]
        print "\n"
        puts horizontal_board_line
      end
    end
  end

  def is_there_a_winner?
    check_board_horizontally? || check_board_vertically? || check_board_diagonally?
  end

  def end_game?
    if is_there_a_winner? == true
      puts "\nWinner! The game will now end. Thanks for playing.\n\n"
      exit
    elsif @board.get_available_positions == []
      puts "\nTie Game. The game will now end. Thanks for playing.\n\n"
      exit
    else
      is_there_a_winner?
    end
  end

  def check_board_horizontally?
    row_length = Math.sqrt(@board.get_game_board.length)
    row = @board.get_game_board.each_slice(row_length).to_a
    row.each do |r|
      return true if r.uniq.size == 1
    end
    false
  end

  def check_board_vertically?
    column_amount = Math.sqrt(@board.get_game_board.length)
    column = @board.get_game_board.group_by.with_index { |_, index| index % column_amount }.values
    column.each do |c|
      return true if c.uniq.size == 1
    end
    false
  end

  def check_board_diagonally?
    check_diagonal_left_to_right? || check_diagonal_right_to_left?
  end

  def check_diagonal_left_to_right?
    board_side_length = Math.sqrt(@board.get_game_board.length)
    left_to_right_index = board_side_length + 1

    diagonal_left_to_right = @board.get_game_board.select.with_index { |_, index| (index % left_to_right_index).zero? }

    diagonal_left_to_right.uniq.size == 1
  end

  def check_diagonal_right_to_left?
    board_side_length = Math.sqrt(@board.get_game_board.length)
    right_to_left_index = board_side_length - 1

    diagonal_right_to_left = @board.get_game_board.select.with_index { |_, index| (index % right_to_left_index).zero? }
    diagonal_right_to_left.pop
    diagonal_right_to_left.shift

    diagonal_right_to_left.uniq.size == 1
  end

  def request_game_type
    puts "\nPlease choose which of the following types of game you would like to play:\n"
    puts "\nOption 1: Human vs Human\n"
    puts "\nOption 2: Human vs Computer\n"
    puts "\nOption 3: Computer vs Human\n"
    puts "\nOption 4: Computer vs Computer\n"
    option = gets.to_i
    if (option >= 1 && option <= 4) == false
      puts "\nError: not an integer between 1 and 4. Please choose again\n."
      request_game_type
    end
    puts "\nYou have selected Option #{option}\n\n"
    option
  end

  def mark_game_board_wrapper(player, position)
    @board.mark_game_board(player, position)
  end

  def get_first_spot_available_wrapper
    @board.get_first_spot_available
  end
end
