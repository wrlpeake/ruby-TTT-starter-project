# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

class PlayTTTGame
  GAME = TicTacToe.new

  def start_game
    GAME.display_welcome_message
    GAME.display_instructions
    GAME.display_game_board
  end

  def make_player_x_turn
    player_x_choice = GAME.request_player_selection('X')
    GAME.mark_game_board('X', player_x_choice)
    GAME.display_game_board
  end

  def make_player_o_turn
    player_o_choice = GAME.request_player_selection('O')
    GAME.mark_game_board('O', player_o_choice)
    GAME.display_game_board
  end

  def begin_play
    start_game
    # turn 1
    make_player_x_turn
    make_player_o_turn
    # turn 2
    make_player_x_turn
    make_player_o_turn
    # turn 3
    make_player_x_turn
    make_player_o_turn
    # turn 4
    make_player_x_turn
    make_player_o_turn
    # last turn
    make_player_x_turn
  end
end

STARTGAME = PlayTTTGame.new
STARTGAME.begin_play
