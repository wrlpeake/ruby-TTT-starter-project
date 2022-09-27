# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

class Board

    def initialize
        @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def mark_game_board(player, position)
        @game_board[position - 1] = player
    end

    def get_available_positions
        @game_board.reject { |pos| pos =~ /[XO]/ }
    end

    def position_available?(position)
        get_available_positions.include? position
    end
    
    def get_game_board
        @game_board
    end

    def get_first_spot_available
        get_available_positions[0]
    end
end