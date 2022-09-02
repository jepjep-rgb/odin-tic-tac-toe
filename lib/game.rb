# frozen_string_literal: true

# Game class for the Tic-Tac-Toe project
class Game
  WINNING_COMBO = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze

  def play
    game_play = true
    while game_play
      Game.start
      Game.game_loop
      game_play = Game.restart?
    end
  end

  private

  def player_name(num)
    puts "Player #{num}, please input your name: "
    name = gets.chomp
    return name
  end

  def player_marker(name, other_marker = '')
    puts "#{name}, please input your marker (should only be 1 character long): "
    marker = gets.chomp until marker.to_s.length == 1 && marker.to_s != other_marker.to_s
    return marker
  end

  def end?
    (@board.board & Player.markers) == Player.markers
  end

  def player_win?(player)
    is_win = false

    WINNING_COMBO.each do |win_check|
      is_win = (player.marker_positions & win_check) == win_check
      break if is_win
    end

    puts "GAME OVER! #{player.name} win!"

    is_win
  end

  def marker_position(name)
    puts "#{name}, please input marker position (1-9): "
    position = gets.chomp until @board.cell_empty?(position)
  end

  class << self
    private

    def start
      @board = Board.new
      name1 = player_name(1)
      marker1 = player_marker(name1)
      @player1 = Player.new(name1, marker1, @board)
  
      name2 = player_name(2)
      marker2 = player_marker(name2, marker1)
      @player2 = Player.new(name2, marker2, @board)
    end

    def game_loop
      until end?
        @board.display_board
        position1 = marker_position(@player1.name)
        @player1.place_marker(position1)

        break if player_win?(@player1) || end?

        position2 = marker_position(@player2.name)
        @player2.place_marker(position2)

        break if player_win?(@player2)
      end
    end

    def restart?
      puts 'Do you want to restart the game? (y/n)'
      input = gets.chomp until input.to_s.downcase == 'y' || input.to_s.downcase == 'n'
      input.to_s.downcase == 'y'
    end
  end
end
