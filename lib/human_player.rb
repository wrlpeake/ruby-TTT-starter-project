# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player
  attr_accessor :marker

  def get_move(selection)
    selection
  end
end
