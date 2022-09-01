class Player
    @@markers = []

    attr_reader :name, :marker, :marker_positions

    def initialize(name, marker, board)
        @name = name
        @marker = marker
        @board = board
        @marker_positions = []
        @@markers << marker
    end

    def place_marker(position)
        @marker_positions << position
        @board.update_board(position, @marker)
    end

end