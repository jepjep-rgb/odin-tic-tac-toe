class Board
    def initialize
        @board = [1..9]
    end

    def update_board(position, marker)
        @board[position - 1] = marker
    end

    def display_board
        puts " "
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "---+---+---"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "---+---+---"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts " "
    end
end