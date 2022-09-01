# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require 'stringio'

describe TicTacToe do
  it 'should display a welcome message when the game is started' do
    ttt = TicTacToe.new

    expect do
      ttt.display_welcome_message
    end.to output("Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n").to_stdout
  end

  it 'should display simple instructions explaining how to play when the game is started' do
    ttt = TicTacToe.new

    expect do
      ttt.display_instructions
    end.to output("This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
                  "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
                  "Choose numbers 1-9 to select your spot on the board\n\n").to_stdout
  end

  it 'should show the user a 3x3 board with numbers 1-9' do
    ttt = TicTacToe.new

    expect do
      ttt.display_game_board
    end.to output("1 | 2 | 3\n" \
                  "---------\n" \
                  "4 | 5 | 6\n" \
                  "---------\n" \
                  "7 | 8 | 9\n" \
                  "---------\n").to_stdout
  end

  it 'should request and receive an integer between 1-9 from the player' do
    # insert module to test user input here
    ttt = TicTacToe.new
    which_player = 'X'
    input = StringIO.new('7')
    $stdin = input
    $stdout = StringIO.new

    player_selection = ttt.request_player_selection(which_player)

    expect(player_selection).to eql 7
  end

  it 'should allow player x to mark the board via by choosing an integer' do
    ttt = TicTacToe.new

    player_selection = 7
    which_player = 'X'
    ttt.mark_game_board(which_player, player_selection)

    expect(ttt.get_game_board).to eql [1, 2, 3, 4, 5, 6, 'X', 8, 9]
  end

  it 'should allow player o to mark the board via by choosing an integer' do
    ttt = TicTacToe.new

    player_selection = 5
    which_player = 'O'
    ttt.mark_game_board(which_player, player_selection)

    expect(ttt.get_game_board).to eql [1, 2, 3, 4, 'O', 6, 7, 8, 9]
  end

  it 'should not let a player choose a spot that has already been selected' do
    ttt = TicTacToe.new

    player_selection = 6
    which_player = 'O'
    ttt.mark_game_board(which_player, player_selection)

    expect(ttt.is_position_available?(player_selection)).to be false
  end

  it 'position should not be available after being marked' do
    ttt = TicTacToe.new

    ttt.mark_game_board('X', 5)

    expect(ttt.available_positions).to eql [1, 2, 3, 4, 6, 7, 8, 9]
  end
end
