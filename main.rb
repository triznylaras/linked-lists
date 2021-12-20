require_relative 'linked_list'

my_list = LinkedList.new
my_list.append('new')
my_list.append('last')
my_list.prepend('first')
puts my_list.to_s
puts "Size: #{my_list.size}"
puts "Head: #{my_list.head.data}"
puts "Tail: #{my_list.tail.data}"
puts "At 1: #{my_list.at(1).data}"
my_list.pop
my_list.insert_at('value_1', 1)
my_list.insert_at('value_2', 3)
puts 'Linked list after inserted new values: '
puts my_list.to_s
my_list.remove_at(2)
puts 'Linked list after removed some values: '
puts my_list.to_s
puts "Contains last? #{my_list.contains?('last')}"
