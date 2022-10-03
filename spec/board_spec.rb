# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'
require_relative '../lib/board'

describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'should return the first available spot on the board' do
    expect(@board.find_first_spot_available).to eql 1
  end

  it 'should keep track of the positions that are available as the game progresses' do
    position = 9
    player = 'X'
    @board.update_game_board(player, position)

    expect(@board.list_available_positions).to eql [1, 2, 3, 4, 5, 6, 7, 8]
  end

  it 'should check that if a position has been taken, it should no longer be available' do
    position = 6
    player = 'O'
    @board.update_game_board(player, position)

    expect(@board.position_available?(position)).to be false
  end

  it 'should return the game board' do
    expect(@board.load_game_board).to eql [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it 'should allow player x to mark the board via by choosing an integer' do
    position = 7
    player = 'X'
    @board.update_game_board(player, position)

    expect(@board.load_game_board).to eql [1, 2, 3, 4, 5, 6, 'X', 8, 9]
  end

  it 'should allow player o to mark the board via by choosing an integer' do
    position = 5
    player = 'O'
    @board.update_game_board(player, position)

    expect(@board.load_game_board).to eql [1, 2, 3, 4, 'O', 6, 7, 8, 9]
  end
end
