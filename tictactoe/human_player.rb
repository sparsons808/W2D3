class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        alpha = ('a'..'z').to_a
        
        p  "#{@mark} please enter a position like so 4 7"
        pos = gets.chomp
        if alpha.include?(pos) || pos.length != 3
            raise 'error invlid position try again'
        else
            position = pos.split(' ').map { |n| n.to_i }
        end

        position
    end
end