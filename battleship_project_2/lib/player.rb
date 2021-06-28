class Player

    def get_move
        p 'enter a position with coordinates separated with a space like "4 7"'
        pos = gets.chomp
        array = []
        pos.each_char do |char|
            if char != " "
                array << char.to_i
            end
        end
        array
    end

end
