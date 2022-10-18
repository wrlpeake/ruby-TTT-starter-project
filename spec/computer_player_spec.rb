# frozen_string_literal: true

require_relative '../lib/computer_player'

describe ComputerPlayer do
  it 'should initialize a new computer player with the marker O' do
    @computer_player = ComputerPlayer.new('O')

    expect(@computer_player.marker).to eq 'O'
  end
end
