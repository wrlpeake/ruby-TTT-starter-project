# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require_relative '../lib/board'

class GameController
  def initialize
    @tictactoe = TicTacToe.new
  end

  def display_start_game_text
    @tictactoe.display_welcome_message
    @tictactoe.display_instructions
    @tictactoe.display_game_board
  end

  def make_human_turn(player)
    player_choice = @tictactoe.request_player_selection(player)
    @tictactoe.mark_game_board_wrapper(player, player_choice)
    @tictactoe.display_game_board
  end

  def make_computer_turn(player)
    first_spot = @tictactoe.get_first_spot_available_wrapper
    puts "\nComputer Player #{player}, has selected: #{first_spot}\n\n"
    @tictactoe.mark_game_board_wrapper(player, first_spot)
    @tictactoe.display_game_board
  end

  def human_vs_human_game
    loop do
      make_human_turn('X')
      @tictactoe.end_game?
      make_human_turn('O')
      @tictactoe.end_game?
    end
  end

  def human_vs_computer_game
    loop do
      make_human_turn('X')
      @tictactoe.end_game?
      make_computer_turn('O')
      @tictactoe.end_game?
    end
  end

  def computer_vs_human_game
    loop do
      make_computer_turn('X')
      @tictactoe.end_game?
      make_human_turn('O')
      @tictactoe.end_game?
    end
  end

  def computer_vs_computer_game
    loop do
      make_computer_turn('X')
      @tictactoe.end_game?
      make_computer_turn('O')
      @tictactoe.end_game?
    end
  end

  def start_game
    display_start_game_text
    game_type = @tictactoe.request_game_type
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
