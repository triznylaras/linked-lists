require_relative 'node'
require 'pry-byebug'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    if !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    counter = 0
    current_node = @head
    until current_node.nil?
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    nil if size < 1
    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    contains = false
    until current_node.nil?
      contains = true if current_node.data == value
      current_node = current_node.next_node
    end
    contains
  end

  def find(value)
    current_node = @head
    index = 0
    found = false
    until current_node.nil?
      found = true if current_node.data == value
      current_node = current_node.next_node
      index += 1 unless found
    end
    index if found
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
    print 'nil'
  end
end
my_list = LinkedList.new
my_list.append('new')
my_list.append('last')
my_list.prepend('first')
puts "Size: #{my_list.size}"
puts "Value at 1: #{my_list.at(1)}"
puts "Pop linked lists: #{my_list.pop}"
puts "Contains last? #{my_list.contains?('last')}"
puts my_list.to_s
