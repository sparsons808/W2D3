require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(length_of_board)
        @player = Player.new
        @board = Board.new(length_of_board)
        @remaining_misses = @board.size * 0.5
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
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
        pos = @player.get_move
        strike = @board.attack(pos)
        
        if strike == false
            @remaining_misses -= 1
        end

        @board.print
        p @remaining_misses
    end
end
