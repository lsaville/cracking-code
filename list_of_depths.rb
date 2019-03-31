require 'pry'
class TreeNode
  attr_accessor :data, :left, :right
  def initialize(data, left=nil, right=nil)
    @data  = data
    @left  = left
    @right = right
  end
end

class LinkedList
  attr_accessor :head
  def initialize(node)
    @head = node
  end

  def prepend(node)
    @head = node if @head == nil
    node.next_node = @head
    @head = node
  end

  def to_s
    current_node = @head
    strings = []

    while current_node != nil
      strings << current_node.data

      current_node = current_node.next_node
    end

    strings.join('->')
  end
end

class ListNode
  attr_accessor :data, :next_node
  def initialize(data, next_node=nil)
    @data      = data
    @next_node = next_node
  end
end

list = LinkedList.new(ListNode.new(3))
list.prepend(ListNode.new(2))
list.prepend(ListNode.new(1))

puts "================================="
puts "list checkedy check"
puts list.to_s

root = TreeNode.new(
  10,
  TreeNode.new(
    5,
    TreeNode.new(9),
    TreeNode.new(18)),
  TreeNode.new(
    20,
    TreeNode.new(3),
    TreeNode.new(7))
)

def print_with_level(tree, level=0)
  return if tree == nil
  puts "#{tree.data} at level: #{level}"
  print_with_level(tree.left, level + 1)
  print_with_level(tree.right, level + 1)
end

puts "================================="
puts print_with_level(root)
puts "================================="

def list_of_depths(tree, level=0, acc=[])
  return acc if tree == nil

  if acc[level]
    acc[level].prepend(ListNode.new(tree.data))
  else
    acc[level] = LinkedList.new(ListNode.new(tree.data))
  end

  list_of_depths(tree.left, level+1, acc)
  list_of_depths(tree.right, level+1, acc)
end

wow = list_of_depths(root)

puts "================================="
puts wow
puts "================================="
puts "================================="
puts wow.inspect
puts "================================="

