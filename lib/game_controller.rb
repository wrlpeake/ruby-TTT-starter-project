# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require_relative '../lib/UI'

class GameController
  def initialize
    @tictactoe = TicTacToe.new
    @UI = UI.new
  end

  def display_start_game_text
    @UI.display_welcome_message
    @UI.display_instructions
    @UI.display_game_board(@tictactoe.get_game_board_wrapper)
  end

  def make_human_turn(player)
    player_selection = @UI.request_player_selection(player)
    case @tictactoe.validate_human_player_selection(player_selection)
    when 1
      @UI.display_wrong_integer_error_message
      make_human_turn(player)
    when 2
      @UI.display_position_not_available_error_message
      make_human_turn(player)
    else
      @UI.display_validated_player_selection(player, player_selection)
      @tictactoe.mark_game_board_wrapper(player, player_selection)
      @UI.display_game_board(@tictactoe.get_game_board_wrapper)
    end
  end

  def make_computer_turn(player)
    first_spot = @tictactoe.get_first_spot_available_wrapper
    @UI.display_computer_player_selection(player, first_spot)
    @tictactoe.mark_game_board_wrapper(player, first_spot)
    @UI.display_game_board(@tictactoe.get_game_board_wrapper)
  end

  def end_game?
    if @tictactoe.is_there_a_winner? == true
      @UI.display_winner_message
      exit
    elsif @tictactoe.get_available_positions_wrapper == []
      @UI.display_tie_game_message
      exit
    else
      @tictactoe.is_there_a_winner?
    end
  end

  def human_vs_human_game
    loop do
      make_human_turn('X')
      end_game?
      make_human_turn('O')
      end_game?
    end
  end

  def human_vs_computer_game
    loop do
      make_human_turn('X')
      end_game?
      make_computer_turn('O')
      end_game?
    end
  end

  def computer_vs_human_game
    loop do
      make_computer_turn('X')
      end_game?
      make_human_turn('O')
      end_game?
    end
  end

  def computer_vs_computer_game
    loop do
      make_computer_turn('X')
      end_game?
      make_computer_turn('O')
      end_game?
    end
  end

  def start_game
    display_start_game_text
    game_type = @UI.request_game_type
    case game_type
    when 1
      human_vs_human_game
    when 2
      human_vs_computer_game
    when 3
      computer_vs_human_game
    else
      computer_vs_computer_game
    end
  end
end

NEW_GAME = GameController.new
NEW_GAME.start_game
