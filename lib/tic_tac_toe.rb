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
      if (i % 3).zero?
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

  def request_player_selection(player)
    puts "\nPlayer #{player}, please choose an integer between 1 and 9.\n"
    position = gets.to_i
    if (position >= 1 && position <= 9) == false
      puts "\nError: not an integer between 1 and 9. Please choose again\n."
      request_player_selection(player)
    elsif position_available?(position) == false
      puts "\nError: already selected. Please choose again.\n"
      request_player_selection(player)
    else
      puts "\nPlayer #{player}, has selected: #{position}\n\n"
      position
    end
  end

  def position_available?(position)
    get_available_positions.include? position
  end

  def mark_game_board(player, position)
    @game_board[position - 1] = player
  end

  def get_available_positions
    @game_board.reject { |pos| pos =~ /[XO]/ }
  end

  def get_game_board
    @game_board
  end

  def is_there_a_winner?
    return true if check_board_horizontally?
    return true if check_board_vertically?

    check_board_diagonally?
  end

  def end_game?
    if is_there_a_winner? == true
      puts "\nWinner! The game will now end. Thanks for playing.\n\n"
      exit
    elsif get_available_positions == []
      puts "\nTie Game. The game will now end. Thanks for playing.\n\n"
      exit
    else
      is_there_a_winner?
    end
  end

  def check_board_horizontally?
    row_length = Math.sqrt(@game_board.length)
    row = @game_board.each_slice(row_length).to_a
    row.each do |r|
      return true if r.uniq.size == 1
    end
    false
  end

  def check_board_vertically?
    column_amount = Math.sqrt(@game_board.length)
    column = @game_board.group_by.with_index { |_, index| index % column_amount }.values
    column.each do |c|
      return true if c.uniq.size == 1
    end
    false
  end

  def check_board_diagonally?
    return true if check_diagonal_left_to_right? == true

    check_diagonal_right_to_left?
  end

  def check_diagonal_left_to_right?
    board_side_length = Math.sqrt(@game_board.length)
    left_to_right_index = board_side_length + 1
    diagonal_left_to_right = @game_board.select.with_index { |_, index| (index % left_to_right_index).zero? }
    diagonal_left_to_right.uniq.size == 1
  end

  def check_diagonal_right_to_left?
    board_side_length = Math.sqrt(@game_board.length)
    right_to_left_index = board_side_length - 1
    diagonal_right_to_left = @game_board.select.with_index { |_, index| (index % right_to_left_index).zero? }
    diagonal_right_to_left.pop
    diagonal_right_to_left.shift
    diagonal_right_to_left.uniq.size == 1
  end
end
