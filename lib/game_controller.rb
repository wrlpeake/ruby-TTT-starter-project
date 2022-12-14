# frozen_string_literal: true

require_relative '../lib/game_logic'
require_relative '../lib/user_interface'
require_relative '../lib/player'

class GameController
  def initialize
    @game_logic = GameLogic.new
    @user_interface = UserInterface.new
    @player_one = Player.new('X')
    @player_two = Player.new('O')
  end

  def display_start_game_text
    @user_interface.display_welcome_message
    @user_interface.display_instructions
    @user_interface.display_game_board(@game_logic.get_game_board)
  end

  def get_game_type_selection
    @user_interface.request_game_type
  end

  def get_game_type
    game_selection = get_game_type_selection.to_i
    if @game_logic.validate_game_type_selection(game_selection).zero?
      @user_interface.display_game_type_error_message
      get_game_type
    else
      @user_interface.display_validate_game_type_selection(game_selection)
      game_selection
    end
  end

  def get_human_selection(player)
    @user_interface.request_player_selection(player.marker)
  end

  def make_human_turn(player)
    selected_cell = get_human_selection(player).to_i
    player_selection = player.get_move(selected_cell)
    case @game_logic.validate_human_player_selection(player_selection)
    when 1
      @user_interface.display_wrong_integer_error_message
      make_human_turn(player)
    when 2
      @user_interface.display_position_not_available_error_message
      make_human_turn(player)
    else
      @game_logic.mark_game_board(player.marker, player_selection)
      @user_interface.display_validated_player_selection(player.marker, player_selection)
      @user_interface.display_game_board(@game_logic.get_game_board)
    end
  end

  def make_computer_turn(player)
    first_spot = @game_logic.get_first_spot_available
    computer_selection = player.get_move(first_spot)
    @user_interface.display_computer_player_selection(player.marker, computer_selection)
    @game_logic.mark_game_board(player.marker, computer_selection)
    @user_interface.display_game_board(@game_logic.get_game_board)
  end

  def get_winner
    @game_logic.is_there_a_winner?
  end

  def get_tie
    @game_logic.get_available_positions == []
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
      make_human_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_human_turn(@player_two)
    end
  end

  def human_vs_computer_game
    while end_game?(get_winner, get_tie) == false
      make_human_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_computer_turn(@player_two)
    end
  end

  def computer_vs_human_game
    while end_game?(get_winner, get_tie) == false
      make_computer_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_human_turn(@player_two)
    end
  end

  def computer_vs_computer_game
    while end_game?(get_winner, get_tie) == false
      make_computer_turn(@player_one)
      break if end_game?(get_winner, get_tie) == true

      make_computer_turn(@player_two)
    end
  end

  def load_game
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
