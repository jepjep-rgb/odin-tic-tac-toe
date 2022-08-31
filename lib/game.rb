class Game
    def start
        puts "Player 1, please input your name: "
        name1 = gets.chomp
        puts "#{name1}, please input your marker (should only be 1 character long): "
        marker1 = gets.chomp until marker1.to_s.length == 1
        @player1 = Player.new(name1, marker1)

        puts "Player 2, please input your name: "
        name2 = gets.chomp
        puts "#{name2}, please input your marker (should only be 1 character long and is not #{marker1}): "
        marker2 = gets.chomp until marker2.to_s.length == 2 && marker2.to_s != marker1.to_s
        @player2 = Player.new(name2, marker2)

        @board = Board.new
    end
end