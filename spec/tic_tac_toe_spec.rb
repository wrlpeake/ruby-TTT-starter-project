# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require 'stringio'

describe TicTacToe do
  before(:each) do
    @tictactoe = TicTacToe.new
  end

  it 'should recognise when there is a winner' do
    @tictactoe.mark_game_board('X', 1)
    @tictactoe.mark_game_board('X', 2)
    @tictactoe.mark_game_board('X', 3)

    expect(@tictactoe.is_there_a_winner?).to be true
  end

  it 'should check for three in a row horizontally' do
    @tictactoe.mark_game_board('O', 7)
    @tictactoe.mark_game_board('O', 8)
    @tictactoe.mark_game_board('O', 9)

    expect(@tictactoe.check_board_horizontally?).to be true
  end

  it 'should check for three in a row vertically' do
    @tictactoe.mark_game_board('O', 2)
    @tictactoe.mark_game_board('O', 5)
    @tictactoe.mark_game_board('O', 8)

    expect(@tictactoe.check_board_vertically?).to be true
  end

  it 'should check the board for three in a row diagonally' do
    @tictactoe.mark_game_board('X', 3)
    @tictactoe.mark_game_board('X', 5)
    @tictactoe.mark_game_board('X', 7)

    expect(@tictactoe.check_board_diagonally?).to be true
  end

  it 'should check for three in a row diagonally from top left to bottom right' do
    @tictactoe.mark_game_board('X', 1)
    @tictactoe.mark_game_board('X', 5)
    @tictactoe.mark_game_board('X', 9)

    expect(@tictactoe.check_diagonal_left_to_right?).to be true
  end

  it 'should check for three in a row diagonally from top right to bottom left' do
    @tictactoe.mark_game_board('O', 3)
    @tictactoe.mark_game_board('O', 5)
    @tictactoe.mark_game_board('O', 7)

    expect(@tictactoe.check_diagonal_right_to_left?).to be true
  end

  it 'should recognise when a game has been tied' do
    @tictactoe.mark_game_board('X', 1)
    @tictactoe.mark_game_board('X', 2)
    @tictactoe.mark_game_board('O', 3)
    @tictactoe.mark_game_board('O', 4)
    @tictactoe.mark_game_board('X', 5)
    @tictactoe.mark_game_board('X', 6)
    @tictactoe.mark_game_board('X', 7)
    @tictactoe.mark_game_board('O', 8)
    @tictactoe.mark_game_board('O', 9)

    expect(@tictactoe.get_available_positions).to eql []
  end

  it 'validate_human_player_selection() should return 0 if the human player selection is valid' do
    position = 4

    validation_code = @tictactoe.validate_human_player_selection(position)

    expect(validation_code).to eql 0
  end

  it 'validate_human_player_selection() should return 1 if the human player selection is not an int between 1-9' do
    position = 13

    validation_code = @tictactoe.validate_human_player_selection(position)

    expect(validation_code).to eql 1
  end

  it 'validate_human_player_selection() should return 2 if the human player selection has already been chosen' do
    @tictactoe.mark_game_board('O', 5)

    position = 5

    validation_code = @tictactoe.validate_human_player_selection(position)

    expect(validation_code).to eql 2
  end

  it 'validate_game_type_selection() should return an integer between 1 and 4 for the game mode' do
    game_type_selection = 3

    validation_code = @tictactoe.validate_game_type_selection(game_type_selection)
    expect(validation_code).to eql game_type_selection
  end

  it 'validate_game_type_selection() should return 0 if the selection is anything other than a number between 1-4' do
    game_type_selection = 6

    validation_code = @tictactoe.validate_game_type_selection(game_type_selection)
    expect(validation_code).to eql 0
  end
end
