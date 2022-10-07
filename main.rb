# frozen_string_literal: true

require_relative './my_enumerable'

array1 = [5, 6, 7]
array2 = [3, 4, 5, 6, 7]

p array1
p array2

#all? any? include? none? each map size count length select find find_all find_index reject max min

puts "my_all? array1"
puts "are 5?: " 
p array1.my_all?(5)
puts "are bigger than 3?:"
p array1.my_all?() {|x| x > 3}
puts "\n"

puts "my_any? array2"
puts "are 5?"
p array2.my_any?(5)
puts "are bigger than 6"
p array2.my_any?() {|x| x > 6}
puts "\n"

puts "my_include? array1 in array2"
p array2.my_include?(array1)
puts "\n"

puts "my_none? array1"
puts "are 5?"
p array1.my_none?(5)
puts "are bigger than 7"
p array1.my_none?() {|n| n>7}
puts "\n"

puts "my_each array2"
puts "iterate"
p array2.my_each()
puts "\n"

puts "my_map array2"
puts "set to 5"
p array2.my_map(5)
puts "\n"

puts "my_size array2"
p array2.my_size()
puts "\n"

puts "my_length array1"
p array1.my_length()
puts "\n"

puts "my_count array2"
puts "count bigger than 4 starting with 3"
p array2.my_count(3) {|x| x>4}
puts "\n"

puts "my_select array1"
puts "select where x<6"
p array1.my_select() {|x| x<6}
puts "\n"

puts "my_find array2"
puts "find first 6"
p array2.my_find(5)
puts "\n"

puts "my_find_all array1"
puts "find_all where x<6"
p array1.my_find_all() {|x| x<6}
puts "\n"

puts "my_find_index array1"
puts "find first index where x<6"
p array1.my_find_index() {|x| x<6}
puts "\n"

puts "my_reject array1"
puts "reject where x<6"
p array1.my_reject() {|x| x<6}
puts "\n"

puts "min array1"
p array1.my_min()
puts "\n"

puts "max array1"
p array1.my_max()
puts "\n"
