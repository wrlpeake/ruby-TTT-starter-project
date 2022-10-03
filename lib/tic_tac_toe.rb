# frozen_string_literal: true

require_relative 'board'

class TicTacToe
  def initialize(board: Board)
    @board = board.new
  end

  def is_there_a_winner?
    check_board_horizontally? || check_board_vertically? || check_board_diagonally?
  end

  def check_board_horizontally?
    row_length = Math.sqrt(@board.load_game_board.length)
    row = @board.load_game_board.each_slice(row_length).to_a
    row.each do |r|
      return true if r.uniq.size == 1
    end
    false
  end

  def check_board_vertically?
    column_amount = Math.sqrt(@board.load_game_board.length)
    column = @board.load_game_board.group_by.with_index { |_, index| index % column_amount }.values
    column.each do |c|
      return true if c.uniq.size == 1
    end
    false
  end

  def check_board_diagonally?
    check_diagonal_left_to_right? || check_diagonal_right_to_left?
  end

  def check_diagonal_left_to_right?
    board_side_length = Math.sqrt(@board.load_game_board.length)
    left_to_right_index = board_side_length + 1

    diagonal_left_to_right = @board.load_game_board.select.with_index { |_, index| (index % left_to_right_index).zero? }

    diagonal_left_to_right.uniq.size == 1
  end

  def check_diagonal_right_to_left?
    board_side_length = Math.sqrt(@board.load_game_board.length)
    right_to_left_index = board_side_length - 1

    diagonal_right_to_left = @board.load_game_board.select.with_index { |_, index| (index % right_to_left_index).zero? }
    diagonal_right_to_left.pop
    diagonal_right_to_left.shift

    diagonal_right_to_left.uniq.size == 1
  end

  def mark_game_board(player, position)
    @board.update_game_board(player, position)
  end

  def get_first_spot_available
    @board.load_first_spot_available
  end

  def get_game_board
    @board.load_game_board
  end

  def get_available_positions
    @board.load_available_positions
  end

  def validate_human_player_selection(position)
    validated = 0
    integer_error = 1
    position_error = 2
    return integer_error if (position >= 1 && position <= 9) == false
    return position_error if @board.position_available?(position) == false

    validated
  end

  def validate_game_type_selection(option)
    input_error = 0
    return input_error if (option >= 1 && option <= 4) == false
    
    option
  end
end
