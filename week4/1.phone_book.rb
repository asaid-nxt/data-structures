# frozen_string_literal: true

# Phone Book Problem
def phone_book(n, commands)
  book = {}
  output = []

  commands.each do |command|
    if command[0] == 'add'
      add(command, book)
    elsif command[0] == 'find'
      output << find(command, book)
    elsif command[0] == 'del'
      del(command, book)
    end
  end

  output.join("\n")
end

def add(command, book)
  _, number, name = command
  book[number] = name
end

def find(command, book)
  _, number = command
  book[number] || 'not found'
end

def del(command, book)
  _, number = command
  book.delete(number)
end






# Input
input = gets("\t\n").chomp.split("\n")
n = input[0].to_i
commands = []
(1..n).each do |i|
  commands << input[i].split
end

puts phone_book(n, commands)
