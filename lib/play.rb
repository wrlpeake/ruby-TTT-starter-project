require_relative '../lib/tic_tac_toe'

class GameLogic
  NEWGAME = TicTacToe.new

  def start_game
    NEWGAME.display_welcome_message
    NEWGAME.display_instructions
    NEWGAME.display_game_board
  end

  def player_x_turn
    player_x_choice = NEWGAME.request_player_selection('X')
    NEWGAME.mark_game_board('X', player_x_choice)
    NEWGAME.display_game_board
  end

  def player_o_turn
    player_o_choice = NEWGAME.request_player_selection('O')
    NEWGAME.mark_game_board('O', player_o_choice)
    NEWGAME.display_game_board
  end

  def begin_play
    start_game
    # turn 1
    player_x_turn
    player_o_turn
    # turn 2
    player_x_turn
    player_o_turn
    # turn 3
    player_x_turn
    player_o_turn
    # turn 4
    player_x_turn
    player_o_turn
    # last turn
    player_x_turn
  end
end

PLAYGAME = GameLogic.new
PLAYGAME.begin_play
