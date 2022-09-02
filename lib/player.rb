# frozen_string_literal: true

# Player class for the Tic-Tac-Toe project
class Player
  @markers = []

  class << self
    attr_accessor :markers

    def list_markers(marker)
      @markers.append(marker)
    end
  end

  attr_reader :name, :marker, :marker_positions

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
    @marker_positions = []
    Player.list_markers(marker)
  end

  def place_marker(position)
    @marker_positions << position
    @board.update_board(position, @marker)
  end
end
