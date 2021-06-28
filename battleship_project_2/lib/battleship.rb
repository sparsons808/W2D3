require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(len)
        @player = Player.new
        @board = Board.new(len)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        puts
        p @board.print
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
        self.lose? || self.win?
    end
    
    def turn
        @board.print

        if @board.attack(@player.get_move) == false
            @remaining_misses -= 1
        end
        puts @remaining_misses
    end
end
