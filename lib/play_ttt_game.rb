# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

class PlayTTTGame
  GAME = TicTacToe.new

  def display_start_game_text
    GAME.display_welcome_message
    GAME.display_instructions
    GAME.display_game_board
  end

  def make_human_turn(player)
    player_choice = GAME.request_player_selection(player)
    GAME.mark_game_board(player, player_choice)
    GAME.display_game_board
  end

  def make_computer_turn(player)
    first_spot = GAME.get_first_spot_available
    puts "\nComputer Player #{player}, has selected: #{first_spot}\n\n"
    GAME.mark_game_board(player, first_spot)
    GAME.display_game_board
  end

  def human_vs_human_game
    loop do
      make_human_turn('X')
      GAME.end_game?
      make_human_turn('O')
      GAME.end_game?
    end
  end

  def human_vs_computer_game
    loop do
      make_human_turn('X')
      GAME.end_game?
      make_computer_turn('O')
      GAME.end_game?
    end
  end

  def computer_vs_human_game
    loop do
      make_computer_turn('X')
      GAME.end_game?
      make_human_turn('O')
      GAME.end_game?
    end
  end

  def computer_vs_computer_game
    loop do
      make_computer_turn('X')
      GAME.end_game?
      make_computer_turn('O')
      GAME.end_game?
    end
  end

  def start_game
    display_start_game_text
    game_type = GAME.request_game_type
    if game_type == 1
      human_vs_human_game
    elsif game_type == 2
      human_vs_computer_game
    elsif game_type == 3
      computer_vs_human_game
    else
      computer_vs_computer_game
    end
  end
end

STARTGAME = PlayTTTGame.new
STARTGAME.start_game
