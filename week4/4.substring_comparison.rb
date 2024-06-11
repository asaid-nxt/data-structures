class SubstringEquality
  def initialize(s)
    @s = s
    @n = s.length
    @p = 31
    @m = 10**9 + 9

    @prefix_hashes = Array.new(@n + 1, 0)
    @powers = Array.new(@n + 1, 1)

    precompute_hashes_and_powers
  end

  def precompute_hashes_and_powers
    (1..@n).each do |i|
      @powers[i] = (@powers[i - 1] * @p) % @m
      @prefix_hashes[i] = (@prefix_hashes[i - 1] * @p + @s[i - 1].ord) % @m
    end
  end

  def hash_substring(a, l)
    hash_value = (@prefix_hashes[a + l] - (@prefix_hashes[a] * @powers[l]) % @m + @m) % @m
    hash_value
  end

  def are_equal(a, b, l)
    hash_substring(a, l) == hash_substring(b, l)
  end
end

def main
  s = gets.chomp
  n = gets.to_i
  queries = Array.new(n) { gets.split.map(&:to_i) }

  substring_equality = SubstringEquality.new(s)

  results = queries.map do |a, b, l|
    substring_equality.are_equal(a, b, l) ? "Yes" : "No"
  end

  puts results
end

main
