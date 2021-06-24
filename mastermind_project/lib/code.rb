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
  # require "byebug"
  def num_near_matches(code)
    # debugger
    arr_of_index_match = []
    (0...code.length).each do |i|
      if code[i] == self[i]
        arr_of_index_match << i
      end
    end
    # debugger
    count = 0
    @pegs.each_with_index do |color_1, i_1|
      code.pegs.each_with_index do |color_2, i_2|
        # debugger
        if  ( color_1 == color_2 && i_1 > i_2 ) && ( !arr_of_index_match.include?(i_1) || arr_of_index_match.include?(i_2) )
        count += 1
        # debugger
        end
      end
    end
    # debugger
    count
  end

  def ==(another_code)
    another_code.pegs == self.pegs
  end
end
