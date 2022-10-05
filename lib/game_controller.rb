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

  def get_game_type_selection
    @user_interface.request_game_type
  end

  def get_game_type(game_selection)
    if @tictactoe.validate_game_type_selection(game_selection).zero?
      @user_interface.display_game_type_error_message
      get_game_type(game_selection)
    else
      @user_interface.display_validate_game_type_selection(game_selection)
      game_selection
    end
  end

  def get_human_selection(player)
    @user_interface.request_player_selection(player)
  end

  def get_human_position(player, player_selection)
    case @tictactoe.validate_human_player_selection(player_selection)
    when 1
      @user_interface.display_wrong_integer_error_message(player)
      get_human_position(player, player_selection)
    when 2
      @user_interface.display_position_not_available_error_message(player)
      get_human_position(player, player_selection)
    else
      player_selection
    end
  end

  def make_human_turn(player, position)
    @user_interface.display_validated_player_selection(player, position)
    @tictactoe.mark_game_board(player, position)
    @user_interface.display_game_board(@tictactoe.get_game_board)
  end

  def make_computer_turn(player)
    first_spot = @tictactoe.get_first_spot_available
    @user_interface.display_computer_player_selection(player, first_spot)
    @tictactoe.mark_game_board(player, first_spot)
    @user_interface.display_game_board(@tictactoe.get_game_board)
  end

  def get_winner
    @tictactoe.is_there_a_winner?
  end

  def get_tie
    @tictactoe.get_available_positions == []
  end

  def end_game?(winner, tie)
    if winner == true
      @user_interface.display_winner_message
      true
    elsif tie == true
      @user_interface.display_tie_game_message
      true
    else
      winner
    end
  end

  def human_vs_human_game
    while end_game?(get_winner, get_tie) == false
      make_human_turn('X', get_human_selection('X'))
      break if end_game?(get_winner, get_tie) == true

      make_human_turn('O', get_human_selection('O'))
    end
  end

  def human_vs_computer_game
    while end_game?(get_winner, get_tie) == false
      make_human_turn('X', get_human_selection('X'))
      break if end_game?(get_winner, get_tie) == true

      make_computer_turn('O')
    end
  end

  def computer_vs_human_game
    while end_game?(get_winner, get_tie) == false
      make_computer_turn('X')
      break if end_game?(get_winner, get_tie) == true

      make_human_turn('O', get_human_selection('O'))
    end
  end

  def computer_vs_computer_game
    while end_game?(get_winner, get_tie) == false
      make_computer_turn('X')
      break if end_game?(get_winner, get_tie) == true

      make_computer_turn('O')
    end
  end

  def load_game
    display_start_game_text
    case get_game_type(get_game_type_selection)
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
