# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

class Board
  def initialize
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update_game_board(player, position)
    @game_board[position - 1] = player
  end

  def list_available_positions
    @game_board.reject { |pos| pos =~ /[XO]/ }
  end

  def position_available?(position)
    list_available_positions.include? position
  end

  def load_game_board
    @game_board
  end

  def find_first_spot_available
    list_available_positions[0]
  end
end
