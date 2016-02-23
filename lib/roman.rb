class Roman

  SYMBOLS = {:I => 1, :V => 5, :X => 10, :L => 50, :C => 100, :D => 500, :M => 1000}

  PATTERN = /^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/

  def initialize(input)
    @roman_numeral = input if input =~ PATTERN
  end

  def to_i
    begin
    numerals.inject(0) do |total, numeral|
      @current_numeral = numeral
      subtract_numeral_from_total? ? (total - numeral_to_integer) : (total + numeral_to_integer)
    end
    rescue
      "Invalid"
    end
  end

  def numerals
    @numerals ||= @roman_numeral.split('')
  end

  def subtract_numeral_from_total?
    has_next_numeral? &&
    next_numeral_is_greater?
  end

  def has_next_numeral?
    !@current_numeral.equal?(numerals.last)
  end

  def next_numeral_is_greater?
    numeral_to_integer < numeral_to_integer(next_numeral)
  end

  def next_numeral
    numerals[(numerals.index { |n| n.equal? @current_numeral } + 1)]
  end

  def numeral_to_integer(numeral = @current_numeral)
    SYMBOLS[numeral.to_sym]
  end
end
