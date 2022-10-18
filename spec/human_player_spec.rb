# frozen_string_literal: true

require_relative '../lib/human_player'

describe HumanPlayer do
  it 'should initialize a new human player with the marker X' do
    @human_player = HumanPlayer.new('X')

    expect(@human_player.marker).to eq 'X'
  end
end
