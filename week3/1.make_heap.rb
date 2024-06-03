# frozen_string_literal: true

# Make Heap Problem
def make_heap(array, n)
  swaps = []
  (n / 2 - 1).downto(0) do |i|
    sift_down(i, array, n, swaps)
  end
  swaps
end

def sift_down(i, array, n, swaps)
  min_index = i
  l = 2 * i + 1
  r = 2 * i + 2

  min_index = l if l < n && array[l] < array[min_index]
  min_index = r if r < n && array[r] < array[min_index]

  if min_index != i
    array[i], array[min_index] = array[min_index], array[i]
    swaps << [i, min_index]
    sift_down(min_index, array, n, swaps)
  end
end

# Input
n = gets.to_i
array = gets.split.map(&:to_i)

# Main
swaps = make_heap(array, n)
puts swaps.size
puts swaps.map { |a, b| "#{a} #{b}" }.join("\n")

