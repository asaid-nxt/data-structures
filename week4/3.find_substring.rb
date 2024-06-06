# frozen_string_literal: true

# Find Substring Problem
def rabin_karp(pattern, text)
  p_len = pattern.length
  t_len = text.length
  return [] if p_len > t_len

  # Prime number and base for polynomial hashing
  p = 1_000_000_007
  x = 263

  # Precompute the highest power of x needed
  x_p_len_minus_1 = x.pow(p_len - 1, p)

  # Compute hash of the pattern and the first window of the text
  pattern_hash = 0
  text_hash = 0

  (0...p_len).each do |i|
    pattern_hash = (pattern_hash * x + pattern[i].ord) % p
    text_hash = (text_hash * x + text[i].ord) % p
  end

  # Result list
  result = []

  # Check the first window
  if pattern_hash == text_hash && text[0, p_len] == pattern
    result << 0
  end

  # Iterate through the text
  (1..(t_len - p_len)).each do |i|
    text_hash = (text_hash - text[i - 1].ord * x_p_len_minus_1) % p
    text_hash = (text_hash * x + text[i + p_len - 1].ord) % p
    text_hash = (text_hash + p) % p # Ensure non-negative

    # Check the current window
    if pattern_hash == text_hash && text[i, p_len] == pattern
      result << i
    end
  end

  result
end

# Input
pattern = gets.chomp
text = gets.chomp

# Main
occurrences = rabin_karp(pattern, text)
puts occurrences.join(' ')
