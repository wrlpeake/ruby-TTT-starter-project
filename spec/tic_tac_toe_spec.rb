# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe TicTacToe do
  it 'should display a welcome message when the game is started' do
    TestGame = TicTacToe.new
    expect(TestGame.display_welcome_message).to eql 'Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n'
  end

  it 'should display simple instructions explaining how to play when the game is started' do
    expect(TestGame.display_instructions).to eql "This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
                                                 "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
                                                 "Choose numbers 1-9 to select your spot on the board\n\n"
  end

  it 'should show the user a 3x3 board with numbers 1-9' do
    game_board = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]
    expect(TestGame.display_game_board(game_board)).to eql [[1, 2, 3],
                                                            [4, 5, 6],
                                                            [7, 8, 9]]
  end

  it 'should request and receive an integer between 1-9 from the the first player, player x' do
    request_player_x_selection = 4
    expect(request_player_x_selection).to be_between(1, 9).inclusive
    # still considering how to structure this test for user input
  end

  it 'should allow player x to mark the board via by choosing an integer' do
    game_board = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]
    player_x_selection = 7
    TestGame.mark_game_board(game_board, player_x_selection)
    expect(game_board[2][0]).to eql 'X'
  end
end

