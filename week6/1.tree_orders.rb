# frozen_string_literal: true

# Tree Orders Problem

class Node
  attr_accessor :key, :left, :right
  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize(n, vertices)
    @nodes = Array.new(n) { Node.new(nil) }
    build_tree(vertices)
  end

  def build_tree(vertices)
    vertices.each_with_index do |(k, l, r), i|
      @nodes[i].key = k
      @nodes[i].left = l == -1 ? nil : @nodes[l]
      @nodes[i].right = r == -1 ? nil : @nodes[r]
    end
  end

  def in_order_traversal
    result = []
    stack = []
    current = @nodes[0]
    while current || !stack.empty?
      while current
        stack.push(current)
        current = current.left
      end
      current = stack.pop
      result << current.key
      current = current.right
    end
    result
  end

  def pre_order_traversal
    result = []
    stack = []
    current = @nodes[0]
    while current || !stack.empty?
      while current
        result << current.key
        stack.push(current)
        current = current.left
      end
      current = stack.pop
      current = current.right
    end
    result
  end

  def post_order_traversal
    result = []
    stack = []
    last_node_visited = nil
    current = @nodes[0]
    while current || !stack.empty?
      while current
        stack.push(current)
        current = current.left
      end
      peek_node = stack.last
      if peek_node.right && last_node_visited != peek_node.right
        current = peek_node.right
      else
        result << peek_node.key
        last_node_visited = stack.pop
        current = nil
      end
    end
    result
  end
end


# Reading input
n = gets.to_i
vertices = Array.new(n) { gets.split.map(&:to_i) }

# Main
tree = BinaryTree.new(n, vertices)
puts tree.in_order_traversal.join(' ')
puts tree.pre_order_traversal.join(' ')
puts tree.post_order_traversal.join(' ')