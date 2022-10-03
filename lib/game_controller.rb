# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require_relative '../lib/user_interface'

class GameController
  def initialize
    @tictactoe = TicTacToe.new
    @user_interface = UserInterface.new
  end

  def display_start_game_text
    @user_interface.display_welcome_message
    @user_interface.display_instructions
    @user_interface.display_game_board(@tictactoe.get_game_board)
  end

  def make_human_turn(player)
    player_selection = @user_interface.request_player_selection(player)
    case @tictactoe.validate_human_player_selection(player_selection)
    when 1
      @user_interface.display_wrong_integer_error_message
      make_human_turn(player)
    when 2
      @user_interface.display_position_not_available_error_message
      make_human_turn(player)
    else
      @user_interface.display_validated_player_selection(player, player_selection)
      @tictactoe.mark_game_board(player, player_selection)
      @user_interface.display_game_board(@tictactoe.get_game_board)
    end
  end

  def make_computer_turn(player)
    first_spot = @tictactoe.get_first_spot_available
    @user_interface.display_computer_player_selection(player, first_spot)
    @tictactoe.mark_game_board(player, first_spot)
    @user_interface.display_game_board(@tictactoe.get_game_board)
  end

  def end_game?
    if @tictactoe.is_there_a_winner? == true
      @user_interface.display_winner_message
      exit
    elsif @tictactoe.get_available_positions == []
      @user_interface.display_tie_game_message
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

  def get_game_type
    game_selection = @user_interface.request_game_type
    if @tictactoe.validate_game_type_selection(game_selection).zero?
      @user_interface.display_game_type_error_message
      get_game_type
    else
      @user_interface.display_validate_game_type_selection(game_selection)
      game_selection
    end
  end

  def start_game
    display_start_game_text
    case get_game_type
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
