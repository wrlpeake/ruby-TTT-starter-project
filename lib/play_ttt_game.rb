# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

class PlayTTTGame
  GAME = TicTacToe.new

  def start_game
    GAME.display_welcome_message
    GAME.display_instructions
    GAME.display_game_board
  end

  def make_player_turn(player)
    player_choice = GAME.request_player_selection(player)
    GAME.mark_game_board(player, player_choice)
    GAME.display_game_board
  end

  def begin_play
    start_game
    # turn 1
    make_player_turn('X')
    make_player_turn('O')
    # turn 2
    make_player_turn('X')
    make_player_turn('O')
    # turn 3
    make_player_turn('X')
    GAME.end_game?
    make_player_turn('O')
    GAME.end_game?
    # turn 4
    make_player_turn('X')
    GAME.end_game?
    make_player_turn('O')
    GAME.end_game?
    # last turn
    make_player_turn('X')
    GAME.end_game?
  end
end

STARTGAME = PlayTTTGame.new
STARTGAME.begin_play
