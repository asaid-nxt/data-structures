# frozen_string_literal: true

# Chaining Simulation Problem
class HashTable
  attr_accessor :buckets

  def initialize(m)
    @m = m
    @buckets = Array.new(m) { [] }
    @p = 1_000_000_007
    @x = 263
  end

  def hash_function(s)
    hash_value = 0
    s.chars.each_with_index do |char, i|
      hash_value = (hash_value + char.ord * @x.pow(i, @p)) % @p
    end
    hash_value % @m
  end

  def add(s)
    index = hash_function(s)
    unless @buckets[index].include?(s)
      @buckets[index].unshift(s)
    end
  end

  def del(s)
    index = hash_function(s)
    @buckets[index].delete(s)
  end

  def find(s)
    index = hash_function(s)
    @buckets[index].include?(s) ? 'yes' : 'no'
  end

  def check(i)
    @buckets[i].join(' ')
  end
end

def phone_book(m, commands)
  hash_table = HashTable.new(m)
  output = []

  commands.each do |command|
    cmd, arg = command.split
    case cmd
    when 'add'
      hash_table.add(arg)
    when 'del'
      hash_table.del(arg)
    when 'find'
      output << hash_table.find(arg)
    when 'check'
      output << hash_table.check(arg.to_i)
    end
  end

  output.join("\n")
end

# Read input
input = gets("\t\n").chomp.split("\n")
m = input[0].to_i
n = input[1].to_i
commands = input[2..-1]

puts phone_book(m, commands)
