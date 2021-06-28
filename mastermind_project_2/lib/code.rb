class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array_chars)
    array_chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def self.random(length)
    arr = []
    i = 0
    while i < length
      arr << POSSIBLE_PEGS.keys.sample
      i += 1
    end
    code_i = Code.new(arr)
  end

  def self.from_string(pegs_str)
    arr = []
    pegs_str.each_char { |char| arr << char.upcase }
    code_i = Code.new(arr)
  end

  def initialize(pegs_array)
    if !Code.valid_pegs?(pegs_array)
      raise "invalid entry"
    else
      @pegs = pegs_array.map { |peg| peg.upcase }
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_i)
    count = 0
    @pegs.each_with_index do |peg, idx|
      if code_i[idx] == peg
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess_code)
    guess = guess_code.pegs.dup
    secrete = @pegs.dup

    (0...secrete.length).each do |i|
      if guess[i] == secrete[i]
        secrete[i] = nil
        guess[i] = nil
      end
    end

    guess.delete(nil)
    secrete.delete(nil)

    count = 0
    guess.each do |char|
      if secrete.include?(char)
        count += 1
        secrete.delete_at(secrete.index(char))
      end
    end
    count
  end

  def ==(code_i)
    code_i.pegs == @pegs
  end
end
