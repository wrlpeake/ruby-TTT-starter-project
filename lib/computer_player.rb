# frozen_string_literal: true

require_relative 'player'

class ComputerPlayer < Player
  attr_accessor :marker

  def get_move(first_spot)
    first_spot
  end
end
