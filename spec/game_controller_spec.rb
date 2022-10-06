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

  it 'get_game_type should request the game type again when given wrong input' do
    @game_controller = GameController.new
    wrong_game_option_one = 7
    wrong_game_option_two = 14
    right_game_option = 2

    allow(@game_controller).to receive(:get_game_type_selection).and_return(wrong_game_option_one,
                                                                            wrong_game_option_two, right_game_option)

    expect(@game_controller.get_game_type).to eql right_game_option
  end

  it 'make_human_turn should display the validated player selection after marking the game board' do
    @game_controller = GameController.new
    human_selection = 7
    player = 'O'
    validated_player_selection_message = /Player #{player}, has selected: #{human_selection}/

    allow(@game_controller).to receive(:get_human_selection).and_return(human_selection)

    expect do
      @game_controller.make_human_turn(player)
    end.to output(validated_player_selection_message).to_stdout
  end

  it 'make_human_turn should request input again if the position is already taken' do
    @game_controller = GameController.new
    first_selection = 7
    repeated_selection = 7
    second_selection = 9
    player = 'O'
    already_selected_message = /Error: already selected. Please choose again./

    allow(@game_controller).to receive(:get_human_selection).and_return(first_selection, repeated_selection,
                                                                        second_selection)
    @game_controller.make_human_turn(player)

    expect do
      @game_controller.make_human_turn(player)
    end.to output(already_selected_message).to_stdout
  end

  it 'make_human_turn should request input again if the input is not an integer between 1-9' do
    @game_controller = GameController.new
    invalid_input = 'foobar'
    valid_input = 4
    player = 'O'
    invalid_input_message = /Error: not an integer between 1 and 9. Please choose again./

    allow(@game_controller).to receive(:get_human_selection).and_return(invalid_input, valid_input)

    expect do
      @game_controller.make_human_turn(player)
    end.to output(invalid_input_message).to_stdout
  end
end
