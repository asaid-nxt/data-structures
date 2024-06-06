# frozen_string_literal: true

# Max in Sliding Window Problem
def max(n, m, arr)
  output = []

  (0..n - m).each do |i|
    output << arr[i, m].max
  end

  output.join(' ')
end











# Input
n = gets.to_i
arr = gets.split.map(&:to_i)
m = gets.to_i

print(max(n, m, arr))
