# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require 'stringio'

describe TicTacToe do
  it 'should display a welcome message when the game is started' do
    tictactoe = TicTacToe.new

    expect do
      tictactoe.display_welcome_message
    end.to output("Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n").to_stdout
  end

  it 'should display simple instructions explaining how to play when the game is started' do
    tictactoe = TicTacToe.new

    expect do
      tictactoe.display_instructions
    end.to output("This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
                  "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
                  "Choose numbers 1-9 to select your spot on the board\n\n").to_stdout
  end

  it 'should show the user a 3x3 board with numbers 1-9' do
    tictactoe = TicTacToe.new

    expect do
      tictactoe.display_game_board
    end.to output("1 | 2 | 3\n" \
                  "---------\n" \
                  "4 | 5 | 6\n" \
                  "---------\n" \
                  "7 | 8 | 9\n" \
                  "---------\n").to_stdout
  end

  it 'should request and receive an integer between 1-9 from the player' do
    tictactoe = TicTacToe.new
    player = 'X'
    random_between_one_and_nine = rand(1..9)
    input = StringIO.new(random_between_one_and_nine.to_s)
    $stdin = input
    $stdout = StringIO.new

    position = tictactoe.request_player_selection(player)

    expect(position).to eql random_between_one_and_nine
  end

  # it 'should display an error message if player enters something other than an integer between 1 and 9'

  it 'should allow player x to mark the board via by choosing an integer' do
    tictactoe = TicTacToe.new

    position = 7
    player = 'X'
    tictactoe.mark_game_board(player, position)

    expect(tictactoe.get_game_board).to eql [1, 2, 3, 4, 5, 6, 'X', 8, 9]
  end

  it 'should allow player o to mark the board via by choosing an integer' do
    tictactoe = TicTacToe.new

    position = 5
    player = 'O'
    tictactoe.mark_game_board(player, position)

    expect(tictactoe.get_game_board).to eql [1, 2, 3, 4, 'O', 6, 7, 8, 9]
  end

  it 'should check that if a position has been taken, it should no longer be available' do
    tictactoe = TicTacToe.new

    position = 6
    player = 'O'
    tictactoe.mark_game_board(player, position)

    expect(tictactoe.position_available?(position)).to be false
  end

  it 'should keep track of the positions that are available as the game progresses' do
    tictactoe = TicTacToe.new

    position = 9
    player = 'X'
    tictactoe.mark_game_board(player, position)

    expect(tictactoe.get_available_positions).to eql [1, 2, 3, 4, 5, 6, 7, 8]
  end
  it 'should check if there is a winner' do
    tictactoe = TicTacToe.new

    tictactoe.mark_game_board('X', 1)
    tictactoe.mark_game_board('X', 2)
    tictactoe.mark_game_board('X', 3)

    expect(tictactoe.is_there_a_winner?).to be true
  end

  it 'should check for three in a row horizontally' do
    tictactoe = TicTacToe.new

    tictactoe.mark_game_board('O', 7)
    tictactoe.mark_game_board('O', 8)
    tictactoe.mark_game_board('O', 9)

    expect(tictactoe.check_board_horizontally?).to be true
  end

  it 'should check for three in a row vertically' do
    tictactoe = TicTacToe.new

    tictactoe.mark_game_board('O', 2)
    tictactoe.mark_game_board('O', 5)
    tictactoe.mark_game_board('O', 8)

    expect(tictactoe.check_board_vertically?).to be true
  end

  it 'should exit the game if a player has won' do
    tictactoe = TicTacToe.new

    tictactoe.mark_game_board('O', 2)
    tictactoe.mark_game_board('O', 5)
    tictactoe.mark_game_board('O', 8)

    expect do
      tictactoe.end_game?
    end.to raise_error(SystemExit)
  end
end
