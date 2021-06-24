require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(code_1)
        puts code_1.num_exact_matches(@secret_code)
        puts code_1.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        text = gets.chomp
        guess_code = Code.from_string(text)
        puts guess_code.num_exact_matches(@secret_code)
        puts guess_code.num_near_matches(@secret_code)
        guess_code == @secret_code
    end
end
