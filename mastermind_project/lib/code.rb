class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  
  def self.valid_pegs?(array_chars)
    array_chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(array_pos_pegs)
    if Code.valid_pegs?(array_pos_pegs) == true
      @pegs = array_pos_pegs.map(&:upcase)
    else
      raise "error, invalid input"
    end
  end

  def self.random(len)
    pegs = []
    len.times { pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](idx)
    @pegs[idx]
  end
  def length
    pegs.length
  end

  def num_exact_matches(code_1)
    count = 0
    code_1.pegs.each_with_index do |peg, i|
      @pegs.each_with_index do |p, i2|
        if peg == p && i == i2
          count += 1
        end
      end
    end
    count
  end
  def num_near_matches(guess)
    secrete_code = self.pegs.dup
    guess_2 = guess.pegs.dup

    (0...secrete_code.size).each do |i|
      if secrete_code[i] == guess_2[i]
        secrete_code[i] = nil
        guess_2[i] = nil
      end
    end

    secrete_code.delete(nil)
    guess_2.delete(nil)

    count = 0
    guess_2.each_with_index do |ele, i|
      if secrete_code.include?(ele)
        count += 1
        secrete_code.delete_at(secrete_code.index(ele))
      end
    end

    count
  end

  def ==(another_code)
    another_code.pegs == self.pegs
  end
end
