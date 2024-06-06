# frozen_string_literal: true

# Stack with Max Problem
def stack_with_max(n, queries)
  max = 0
  stack = []
  output = []

  queries.each do |query|
    case query[0]
    when 'push'
      stack.push(query[1].to_i)
    when 'pop'
      stack.pop
    when 'max'
      output << stack.max
    end
  end

  output.join("\n")
end


# Read input
input = gets("\t\n").chomp.split("\n")
n = input[0].to_i
queries = []
(1..n).each do |i|
  queries << input[i].split
end
print(stack_with_max(n, queries))
