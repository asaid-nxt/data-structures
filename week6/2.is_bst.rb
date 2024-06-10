# frozen_string_literal: true

# Is it A Binary Search Tree ? Problem
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

  def bst?
    return 'CORRECT' if @nodes.empty?
    return 'CORRECT' if validate_bst(@nodes[0])
    'INCORRECT'
  end

  private

  def validate_bst(root)
    stack = [[root, -Float::INFINITY, Float::INFINITY]]

    until stack.empty?
      node, min, max = stack.pop

      return false if node.key <= min || node.key >= max

      if node.right
        stack.push([node.right, node.key, max])
      end

      if node.left
        stack.push([node.left, min, node.key])
      end
    end

    true
  end
end


# Reading input
n = gets.to_i
vertices = Array.new(n) { gets.split.map(&:to_i) }

# Main
tree = BinaryTree.new(n, vertices)
puts tree.bst?
