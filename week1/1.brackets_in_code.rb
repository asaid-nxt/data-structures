# frozen_string_literal: true

# brackets in code problem
def check_brackets(string, stack, opening_symbols, closing_symbols)
  string.each_char.with_index do |char, i|
    if opening_symbols.include?(char)
      stack << [char, i]
    elsif closing_symbols.include?(char)
      left = stack.pop[0] unless stack.empty?
      return i + 1 unless opening_symbols.find_index(left) == closing_symbols.find_index(char)
    end
  end
  stack.empty? ? 'Success' : stack.first[1] + 1
end



# input
input = gets.chomp
stack = []
opening_symbols = ['{', '[', '(']
closing_symbols = ['}', ']', ')']

print check_brackets(input, stack, opening_symbols, closing_symbols)
