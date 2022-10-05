# frozen_string_literal: true

require_relative '../lib/game_controller'
require 'stringio'

describe GameController do
  it 'can play a computer v computer game' do
    @game_controller = GameController.new
    winning_message = /Winner! The game will now end. Thanks for playing./

    allow(@game_controller).to receive(:get_game_type).and_return(4)
    expect do
      @game_controller.load_game
    end.to output(winning_message).to_stdout
  end

  it 'can play a human v computer game' do
    @game_controller = GameController.new
    winning_message = /Winner! The game will now end. Thanks for playing./

    allow(@game_controller).to receive(:get_game_type).and_return(2)
    allow(@game_controller).to receive(:get_human_selection).and_return(1, 5, 9)

    expect do
      @game_controller.load_game
    end.to output(winning_message).to_stdout
  end

  it 'can play a computer v human game' do
    @game_controller = GameController.new
    winning_message = /Winner! The game will now end. Thanks for playing./

    allow(@game_controller).to receive(:get_game_type).and_return(3)
    allow(@game_controller).to receive(:get_human_selection).and_return(3, 5, 7)

    expect do
      @game_controller.load_game
    end.to output(winning_message).to_stdout
  end

  it 'can play a human v human game' do
    @game_controller = GameController.new
    winning_message = /Winner! The game will now end. Thanks for playing./

    allow(@game_controller).to receive(:get_game_type).and_return(1)
    allow(@game_controller).to receive(:get_human_selection).and_return(1, 2, 5, 7, 9)

    expect do
      @game_controller.load_game
    end.to output(winning_message).to_stdout
  end

  it 'can play a human v human tie game' do
    @game_controller = GameController.new
    tie_game_message = /Tie Game. The game will now end. Thanks for playing./

    allow(@game_controller).to receive(:get_game_type).and_return(1)
    allow(@game_controller).to receive(:get_human_selection).and_return(1, 3, 2, 4, 5, 8, 6, 9, 7)

    expect do
      @game_controller.load_game
    end.to output(tie_game_message).to_stdout
  end

  it 'end_game? should return true if there is a winner' do
    @game_controller = GameController.new

    $stdout = StringIO.new

    expect(@game_controller.end_game?(true, false)).to be true
  end

  it 'end_game? should return true if there is a tie' do
    @game_controller = GameController.new

    $stdout = StringIO.new

    expect(@game_controller.end_game?(false, true)).to be true
  end

  it 'end_game? should return false if there is a no winner or no tie' do
    @game_controller = GameController.new

    $stdout = StringIO.new

    expect(@game_controller.end_game?(false, false)).to be false
  end

  it 'get_game_type should return a validated game option' do
    @game_controller = GameController.new
    game_option = 3

    allow(@game_controller).to receive(:get_game_type_selection).and_return(game_option)

    expect(@game_controller.get_game_type).to eql game_option
  end

  it 'make human turn should mark the game board with the validated human player selection display' do
    @game_controller = GameController.new
    human_selection = 7
    player = 'O'
    validated_player_selection_message = /Player #{player}, has selected: #{human_selection}/

    allow(@game_controller).to receive(:get_human_selection).and_return(human_selection)

    expect do
      @game_controller.make_human_turn(player)
    end.to output(validated_player_selection_message).to_stdout
  end
end
