class Board

    attr_reader :size

    def self.print_grid(array)
        array.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |grid|
            grid.each do |ele|
                if ele == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ships_tobe_placed = @size * 0.25

        while num_ships < ships_tobe_placed
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        new_grid = Array.new(@grid.length) { Array.new(@grid.length, :N) }
        @grid.each_with_index do |row, i1|
            row.each_with_index do |ele, i2|
                if ele == :X
                    new_grid[i1][i2] = :X
                end
            end
        end
        new_grid
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
