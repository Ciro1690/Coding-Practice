require_relative "board"
require_relative "player"
require_relative "board"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n*n/2
    end

    def start_game
        @board.place_random_ships
        @board.print
        puts "There are "+ @board.num_ships.to_s + " ships left."
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end
    
    def turn
        coord = @player.get_move
        if !@board.attack(coord)
            @remaining_misses -=1
        end
        @board.print
        puts "You have "+ @remaining_misses.to_s + " remaining attempts."
        puts "There are " + @board.num_ships.to_s + " ships left."
    end
end
