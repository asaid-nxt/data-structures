# frozen_string_literal: true

# tree height problem

# Build the tree
def build_tree(n, parents)
  nodes = Array.new(n) { [] }
  root = nil
  parents.each_with_index do |parent, index|
    if parent == -1
      root = index
    else
      nodes[parent] << index
    end
  end
  [root, nodes]
end

# Function to compute the height of the tree using BFS
def tree_height(root, nodes)
  return 0 if root.nil?

  height = 0
  queue = [root]
  until queue.empty?
    level_size = queue.size
    height += 1
    level_size.times do
      current = queue.shift
      queue.concat(nodes[current])
    end
  end

  height
end


# Read input from the console
def read_input
  n = gets.to_i
  parents = gets.split.map(&:to_i)
  [n, parents]
end

# Main
n, parents = read_input
root, nodes = build_tree(n, parents)
puts tree_height(root, nodes)
