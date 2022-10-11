# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  it 'should initialize with a marker as an attribute' do
    @player = Player.new('O')

    expect(@player.marker).to eq 'O'
  end
end
