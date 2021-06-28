require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_i)
        p @secret_code.num_exact_matches(code_i)
        p @secret_code.num_near_matches(code_i)
    end

    def ask_user_for_guess
        p 'Enter a code'
        code = gets.chomp
        code_i = Code.from_string(code)
        self.print_matches(code_i)
        @secret_code == code_i
    end
end
