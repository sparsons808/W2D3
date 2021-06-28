class Board
    attr_reader :size

    def initialize(num)
        @grid = Array.new(num) { Array.new(num, :N) }
        @size = num * num
    end

    def self.print_grid(array)
        array.each do |row|
            puts row.join(" ")
        end
    end

    def [](ar_row_collom)
        @grid[ar_row_collom[0]][ar_row_collom[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |arr|
            arr.each do |pos|
                if pos == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end
    # require "byebug"
    def place_random_ships
        # debugger
        percentage_ships = self.size * 0.25
        percentage_ships = percentage_ships.to_i
        i = 0
        while i < percentage_ships
            current_row = @grid[i % @grid.length]
            current_row << :S
            current_row.shuffle
            i += 1 
        end
    end

    def hidden_ships_grid
        base = @grid.last
        hight = @grid.length
        width = base.length

        hidden_ships = Array.new(hight) { Array.new(width) }
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |col, idx2|
                if @grid[idx1][idx2] != :S
                    hidden_ships[idx1][idx2] = col
                elsif @grid[idx1][idx2] == :S
                    hidden_ships[idx1][idx2] = :N
                end
            end
        end
        hidden_ships
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
