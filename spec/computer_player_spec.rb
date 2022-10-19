# frozen_string_literal: true

require_relative '../lib/computer_player'

describe ComputerPlayer do
  it 'should initialize a new computer player with the marker O' do
    @computer_player = ComputerPlayer.new('O')

    expect(@computer_player.marker).to eq 'O'
  end

  it 'should get the board position for its move' do
    @computer_player = ComputerPlayer.new('X')
    first_spot_available = 3

    expect(@computer_player.get_move(first_spot_available)).to eq first_spot_available
  end
end
