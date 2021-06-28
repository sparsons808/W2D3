class Board
    
    def initialize
        @game_grid = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(position)
        return ( position[0] < @game_grid.length && position[1] < @game_grid.length ) && ( position[0] >= 0 && position[1] >= 0 )
    end

    def empty?(position)
        i = position[0]
        i2 = position[1]
        return @game_grid[i][i2] == '_'
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @game_grid[position[0]][position[1]] = mark
        else
            raise "position invalid or full"
        end
    end

    def print
        @game_grid.each { |row| p row }
    end

    def win_row?(mark)
        @game_grid.any? { |row| row.all? { |ele| ele == mark } }
    end

    def win_col?(mark)
        i = 0

        while i < @game_grid.length
            return true if @game_grid.all? { |row| row[i] == mark }
            i += 1
        end
        false
    end

    def win_diagonal?(mark)
        i = 0
        count = 0
        while i < @game_grid.length
            if @game_grid[i][i] == mark
                count += 1
            end
            i += 1
        end

        count_reverse = 0
        i2 = @game_grid.length - 1
        idx = 0
        while i2 >= 0
            if @game_grid[idx][i2] == mark
                count_reverse += 1
            end
            i2 -= 1
            idx += 1
        end

        count == @game_grid.length || count_reverse == @game_grid.length
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end 

    def empty_positions?
        @game_grid.any? { |row| row.include?("_") }
    end
end