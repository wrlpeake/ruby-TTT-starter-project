# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  it 'should initialize with a marker as an attribute' do
    @player = Player.new('O')

    expect(@player.marker).to eq 'O'
  end

  it 'should get the position for a move' do
    @player = Player.new('X')
    position = 3

    expect(@player.get_move(position)).to eq position
  end
end
