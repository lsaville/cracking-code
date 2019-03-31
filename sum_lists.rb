class LinkedList
  attr_accessor :head

  def initialize(head_node=nil)
    @head = head_node
  end

  def prepend(node)
    if @head == nil
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def to_s
    # only works with ints
    current_node = @head

    strings = []

    while current_node != nil
      strings << current_node.data
      current_node = current_node.next_node
    end

    strings.map(&:to_s).join('->')
  end
end

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node=nil)
    @data      = data
    @next_node = next_node
  end
end

linked_list_1 = LinkedList.new(Node.new(6))
linked_list_1.prepend(Node.new(1))
linked_list_1.prepend(Node.new(7))

linked_list_2 = LinkedList.new(Node.new(2))
linked_list_2.prepend(Node.new(9))
linked_list_2.prepend(Node.new(5))

def sum_lists(list_1, list_2)
  list_to_int(list_1) + list_to_int(list_2)
end

def list_to_int(list)
  raise "Empty list" unless list.head

  sum          = 0
  index        = 0
  current_node = list.head

  while current_node != nil
    sum   += current_node.data * 10**index
    index += 1
    current_node = current_node.next_node
  end
  
  sum
end

puts "=================================================="
puts "List 1: #{linked_list_1.to_s}"
puts "List 2: #{linked_list_2.to_s}"
puts "=================================================="
puts "List 1 to int: #{list_to_int(linked_list_1)}"
puts "List 2 to int: #{list_to_int(linked_list_2)}"
puts "=================================================="
puts "Final sum: #{sum_lists(linked_list_1, linked_list_2)}"
puts "=================================================="
