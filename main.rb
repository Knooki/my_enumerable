# frozen_string_literal: true

require_relative './my_enumerable'

array1 = [5, 5, 5]
array2 = [3, 4, 5, 6, 7]

puts 'array1:'
p array1
puts 'array2:'
p array2
puts "\n"


# puts 'any?'
# p [].none?
# p [].my_none?
# p [].none? { |x| x > 4 }
# p [].my_none? { |x| x > 4 }
# p [].none?(Numeric)
# p [].my_none?(Numeric)
# p [].none?(Numeric) { |x| x > 4 }
# p [].my_none?(Numeric) { |x| x > 4 }

p [].count
p [].my_count
p [].count(3) {|x| x > 0}
p [].my_count(3) {|x| x > 0}

# all? any? include? none? each map size count length select find find_all find_index reject max min

# puts 'all? array1'
# p array1.all?(Numeric)
# p array1.all? { |x| x > 3 }
# p array1.all?(5) { |x| x > 3 }

# puts 'my_all? array1'
# p array1.my_all?(Numeric)
# p array1.my_all? { |x| x > 3 }
# p array1.my_all?(5) { |x| x > 3 }
# puts "\n"

# puts 'any? array1'
# p array1.any?(Numeric)
# p array1.any? { |x| x > 3 }
# p array1.any?(5) { |x| x > 3 }

# puts 'my_any? array1'
# p array1.my_any?(Numeric)
# p array1.my_any? { |x| x > 3 }
# p array1.my_any?(5) { |x| x > 3 }
# puts "\n"

# puts 'none? array1'
# p array1.none?(Numeric)
# p array1.none? { |x| x < 3 }
# p array1.none?(5) { |x| x > 3 }

# puts 'my_none? array1'
# p array1.my_none?(Numeric)
# p array1.my_none? { |x| x < 3 }
# p array1.my_none?(5) { |x| x > 3 }
# puts "\n"

# puts "each array2"
# p array2.each
# array2.each {|item| print "item", item}

# puts 'my_each array2'
# p array2.my_each
# array2.my_each {|item| print "item", item}

# puts 'my_include? 3 in array2'
# p array2.my_include?(3)
# puts "\n"

# puts 'include? 3 in array2'
# p array2.include?(3)

# puts 'my_map array2'
# puts 'set to 5'
# p array2.my_map! {|x| x = 5}
# p array2
# puts "\n"

# puts 'my_map array2'
# puts 'set to 5'
# p array2.map! {|x| x = 6}
# p array2
# puts "\n"

# puts 'my_size array2'
# p array2.my_size
# puts "\n"

# puts "size array2"
# p array2.size
# puts "\n"

# puts 'count array2'
# p array2.count
# p array2.count(3)
# p array2.count { |x| x > 4 }
# p array2.count(3) { |x| x > 4 }

# puts 'my_count array2'
# p array2.my_count
# p array2.my_count(3)
# p array2.my_count { |x| x > 4 }
# p array2.my_count(3) { |x| x > 4 }
# puts "\n"

# puts "length array2"
# p array2.length
# puts "\n"

# puts 'my_length array2'
# p array2.my_length
# puts "\n"

# puts 'select array2'
# p array2.select
# p array2.select { |x| x < 6 }
# puts "\n"

# puts 'my_select array2'
# p array2.my_select
# p array2.my_select { |x| x < 6 }
# puts "\n"

# arg = Proc.new {"No matches found"}

# puts 'find array2'
# p array2.find(arg)
# p array2.find(arg) { |i| i % 10 == 0 } #=> nil

# puts 'my_find array2'
# p array2.my_find(arg)
# p array2.my_find(arg) { |i| i % 10 == 0 } #=> nil
# puts "\n"

# puts 'find_all array2'
# p array2.find_all
# p array2.find_all { |x| x > 10 }

# puts 'my_find_all array1'
# p array2.my_find_all
# p array2.my_find_all { |x| x > 10 }
# puts "\n"

# puts "find_index array2"
# p array2.find_index()
# p array2.find_index(3)
# p array2.find_index(3) {|x| x > 4}
# p array2.find_index {|x| x > 4}
# puts "\n"

# puts 'my_find_index array1'
# p array2.my_find_index()
# p array2.my_find_index(3)
# p array2.my_find_index(3) {|x| x > 4}
# p array2.my_find_index {|x| x > 4}
# puts "\n"

# puts 'reject array2'
# p array2.reject
# p array2.reject { |x| x < 6 }

# p array2

# puts 'my_reject array2'
# p array2.my_reject
# p array2.my_reject { |x| x < 6 }
# puts "\n"
# puts 'min array1'
# p array1.my_min
# puts "\n"

puts 'max array2'
p array2.max
p array2.max(3)
p array2.max { |a, b| -a <=> -b }
p array2.max(2) { |a, b| -a <=> -b }
puts "\n"

puts 'my_max array2'
p array2.my_max
p array2.my_max(3)
p array2.my_max { |a, b| -a <=> -b }
p array2.my_max(2) { |a, b| -a <=> -b }
