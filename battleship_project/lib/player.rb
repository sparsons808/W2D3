class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        nput = gets.chomp
        pos = []
        nput.split(" ").each { |char| pos << char.to_i }
        pos
    end
end
