class Game
    def play
        Game.start
        Game.game_loop 
    end

    private
    
    def start
        @board = Board.new

        puts "Player 1, please input your name: "
        name1 = gets.chomp
        puts "#{name1}, please input your marker (should only be 1 character long): "
        marker1 = gets.chomp until marker1.to_s.length == 1
        @player1 = Player.new(name1, marker1, @board)

        puts "Player 2, please input your name: "
        name2 = gets.chomp
        puts "#{name2}, please input your marker (should only be 1 character long and is not #{marker1}): "
        marker2 = gets.chomp until marker2.to_s.length == 2 && marker2.to_s != marker1.to_s
        @player2 = Player.new(name2, marker2, @board)
    end

    def end?
        (@board.board - Player.markers) == Player.markers
    end

    def player_win?(player)
        WINNING_COMBO = [
            [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]
        ]
        
        is_win = false

        WINNING_COMBO.each do |win_check|
            is_win = (player.marker_positions - win_check) == win_check
            break if is_win
        end

        is_win
    end

    def game_loop
        until end?
            @board.display_board
            puts "#{@player1.name}, please input marker position (1-9): "
            position1 = gets.chomp until @board.cell_empty?(position1)
            
            puts "#{@player2.name}, please input marker position (1-9): "
            position2 = gets.chomp until @board.cell_empty?(position2)
        end
    end
end