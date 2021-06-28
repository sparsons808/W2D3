
require "/Users/sydneyparsons/Documents/App_Academy_Work/W2/w2d3/tictactoe/board.rb" 
require "/Users/sydneyparsons/Documents/App_Academy_Work/W2/w2d3/tictactoe/human_player.rb"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(:X)
        @player_2_mark = HumanPlayer.new(:O)
        @board = Board.new
        @current_player = @player_1_mark
    end

    def switch_turn
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
        @current_player
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                return p "#{@current_player} you win!!"
            else
               self.switch_turn
               self.play
            end
        end
        p 'This game is a draw, play again'   
    end

end