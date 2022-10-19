# frozen_string_literal: true

require_relative '../lib/game_logic'
require 'stringio'

describe GameLogic do
  before(:each) do
    @game_logic = GameLogic.new
  end

  it 'should recognise when there is a winner' do
    marker = 'X'
    @game_logic.mark_game_board(marker, 1)
    @game_logic.mark_game_board(marker, 2)
    @game_logic.mark_game_board(marker, 3)

    expect(@game_logic.is_there_a_winner?).to be true
  end

  it 'should check for three in a row horizontally' do
    marker = 'O'
    @game_logic.mark_game_board(marker, 7)
    @game_logic.mark_game_board(marker, 8)
    @game_logic.mark_game_board(marker, 9)

    expect(@game_logic.check_board_horizontally?).to be true
  end

  it 'should check for three in a row vertically' do
    marker = 'O'
    @game_logic.mark_game_board(marker, 2)
    @game_logic.mark_game_board(marker, 5)
    @game_logic.mark_game_board(marker, 8)

    expect(@game_logic.check_board_vertically?).to be true
  end

  it 'should check the board for three in a row diagonally' do
    marker = 'X'
    @game_logic.mark_game_board(marker, 3)
    @game_logic.mark_game_board(marker, 5)
    @game_logic.mark_game_board(marker, 7)

    expect(@game_logic.check_board_diagonally?).to be true
  end

  it 'should check for three in a row diagonally from top left to bottom right' do
    marker = 'X'
    @game_logic.mark_game_board(marker, 1)
    @game_logic.mark_game_board(marker, 5)
    @game_logic.mark_game_board(marker, 9)

    expect(@game_logic.check_diagonal_left_to_right?).to be true
  end

  it 'should check for three in a row diagonally from top right to bottom left' do
    marker = 'O'
    @game_logic.mark_game_board(marker, 3)
    @game_logic.mark_game_board(marker, 5)
    @game_logic.mark_game_board(marker, 7)

    expect(@game_logic.check_diagonal_right_to_left?).to be true
  end

  it 'should recognise when a game has been tied' do
    player_one_marker = 'X'
    player_two_marker = 'O'
    @game_logic.mark_game_board(player_one_marker, 1)
    @game_logic.mark_game_board(player_one_marker, 2)
    @game_logic.mark_game_board(player_two_marker, 3)
    @game_logic.mark_game_board(player_two_marker, 4)
    @game_logic.mark_game_board(player_one_marker, 5)
    @game_logic.mark_game_board(player_one_marker, 6)
    @game_logic.mark_game_board(player_one_marker, 7)
    @game_logic.mark_game_board(player_two_marker, 8)
    @game_logic.mark_game_board(player_two_marker, 9)

    expect(@game_logic.get_available_positions).to eql []
  end

  it 'validate_human_player_selection() should return 0 if the human player selection is valid' do
    position = 4

    validation_code = @game_logic.validate_human_player_selection(position)

    expect(validation_code).to eql 0
  end

  it 'validate_human_player_selection() should return 1 if the human player selection is not an int between 1-9' do
    position = 13

    validation_code = @game_logic.validate_human_player_selection(position)

    expect(validation_code).to eql 1
  end

  it 'validate_human_player_selection() should return 2 if the human player selection has already been chosen' do
    @game_logic.mark_game_board('O', 5)

    position = 5

    validation_code = @game_logic.validate_human_player_selection(position)

    expect(validation_code).to eql 2
  end

  it 'validate_game_type_selection() should return an integer between 1 and 4 for the game mode' do
    game_type_selection = 3

    validation_code = @game_logic.validate_game_type_selection(game_type_selection)
    expect(validation_code).to eql game_type_selection
  end

  it 'validate_game_type_selection() should return 0 if the selection is anything other than a number between 1-4' do
    game_type_selection = 6

    validation_code = @game_logic.validate_game_type_selection(game_type_selection)
    expect(validation_code).to eql 0
  end

  it 'create_player() should initialize an instance of the player class, with the marker as an attribute' do
    marker = 'X'
    @player_one = @game_logic.create_player(marker)

    expect(@player_one.marker).to eql marker
  end
end
