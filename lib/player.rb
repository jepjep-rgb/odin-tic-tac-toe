# frozen_string_literal: true

# Player class for the Tic-Tac-Toe project
class Player
  @markers = []

  attr_reader :name, :marker, :marker_positions, :markers

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
    @marker_positions = []
    @markers << marker
  end

  def place_marker(position)
    @marker_positions << position
    @board.update_board(position, @marker)
  end
end
