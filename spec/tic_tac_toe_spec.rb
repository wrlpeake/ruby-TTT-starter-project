# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require 'stringio'

describe TicTacToe do
  before(:each) do
    @tictactoe = TicTacToe.new
  end

  it 'should display a welcome message when the game is started' do
    expect do
      @tictactoe.display_welcome_message
    end.to output("Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)\n\n").to_stdout
  end

  it 'should display simple instructions explaining how to play when the game is started' do
    expect do
      @tictactoe.display_instructions
    end.to output("This is a two-player game. The first player will be the 'X' team, the second player will be 'O' team.\n\n" \
                  "The aim of the game is to get three of your symbol in a row, taking in turns to select your spot on a 3x3 board.\n\n" \
                  "Choose numbers 1-9 to select your spot on the board\n\n").to_stdout
  end

  it 'should request and receive an integer between 1-9 from the player' do
    player = 'X'
    random_between_one_and_nine = rand(1..9)
    input = StringIO.new(random_between_one_and_nine.to_s)
    $stdin = input
    $stdout = StringIO.new

    position = @tictactoe.request_player_selection(player)

    expect(position).to eql random_between_one_and_nine
  end

  it 'should show the user a 3x3 board with numbers 1-9' do
    expect do
      @tictactoe.display_game_board
    end.to output("1 | 2 | 3\n" \
                  "---------\n" \
                  "4 | 5 | 6\n" \
                  "---------\n" \
                  "7 | 8 | 9\n" \
                  "---------\n").to_stdout
  end

  it 'should check if there is a winner' do
    @tictactoe.mark_game_board_wrapper('X', 1)
    @tictactoe.mark_game_board_wrapper('X', 2)
    @tictactoe.mark_game_board_wrapper('X', 3)

    expect(@tictactoe.is_there_a_winner?).to be true
  end

  it 'should check for three in a row horizontally' do
    @tictactoe.mark_game_board_wrapper('O', 7)
    @tictactoe.mark_game_board_wrapper('O', 8)
    @tictactoe.mark_game_board_wrapper('O', 9)

    expect(@tictactoe.check_board_horizontally?).to be true
  end

  it 'should check for three in a row vertically' do
    @tictactoe.mark_game_board_wrapper('O', 2)
    @tictactoe.mark_game_board_wrapper('O', 5)
    @tictactoe.mark_game_board_wrapper('O', 8)

    expect(@tictactoe.check_board_vertically?).to be true
  end

  it 'should exit the game if a player has won' do
    @tictactoe.mark_game_board_wrapper('O', 2)
    @tictactoe.mark_game_board_wrapper('O', 5)
    @tictactoe.mark_game_board_wrapper('O', 8)

    expect do
      @tictactoe.end_game?
    end.to raise_error(SystemExit)
  end

  it 'should check the board for three in a row diagonally' do
    @tictactoe.mark_game_board_wrapper('X', 3)
    @tictactoe.mark_game_board_wrapper('X', 5)
    @tictactoe.mark_game_board_wrapper('X', 7)

    expect(@tictactoe.check_board_diagonally?).to be true
  end

  it 'should check for three in a row diagonally from top left to bottom right' do
    @tictactoe.mark_game_board_wrapper('X', 1)
    @tictactoe.mark_game_board_wrapper('X', 5)
    @tictactoe.mark_game_board_wrapper('X', 9)

    expect(@tictactoe.check_diagonal_left_to_right?).to be true
  end

  it 'should check for three in a row diagonally from top right to bottom left' do
    @tictactoe.mark_game_board_wrapper('O', 3)
    @tictactoe.mark_game_board_wrapper('O', 5)
    @tictactoe.mark_game_board_wrapper('O', 7)

    expect(@tictactoe.check_diagonal_right_to_left?).to be true
  end

  it 'should exit when a game has been tied' do
    @tictactoe.mark_game_board_wrapper('X', 1)
    @tictactoe.mark_game_board_wrapper('X', 2)
    @tictactoe.mark_game_board_wrapper('O', 3)
    @tictactoe.mark_game_board_wrapper('O', 4)
    @tictactoe.mark_game_board_wrapper('X', 5)
    @tictactoe.mark_game_board_wrapper('X', 6)
    @tictactoe.mark_game_board_wrapper('X', 7)
    @tictactoe.mark_game_board_wrapper('O', 8)
    @tictactoe.mark_game_board_wrapper('O', 9)

    expect do
      @tictactoe.end_game?
    end.to raise_error(SystemExit)
  end

  it 'should ask the user to select a number between 1-4 for the game type' do
    random_between_one_and_four = rand(1..4)
    input = StringIO.new(random_between_one_and_four.to_s)
    $stdin = input
    $stdout = StringIO.new

    game_type = @tictactoe.request_game_type

    expect(game_type).to eql random_between_one_and_four
  end

  it 'should return 0 if the human player selection is valid' do
    position = 4

    validation_code = @tictactoe.validate_human_player_selection(position)

    expect(validation_code).to eql 0
  end

  it 'should return 1 if the human player selection is not an int between 1-9' do
    position = 13

    validation_code = @tictactoe.validate_human_player_selection(position)

    expect(validation_code).to eql 1
  end

  it 'should return 2 if the human player selection has already been chosen' do
    @tictactoe.mark_game_board_wrapper('O', 5)

    position = 5

    validation_code = @tictactoe.validate_human_player_selection(position)

    expect(validation_code).to eql 2
  end
end
