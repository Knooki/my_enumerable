# frozen_string_literal: true

# all? any? include? none? each map size count length select find find_all find_index reject max min

require 'set'

# extension with my methods for Array class
module MyEnumerable
  def my_all?(pattern = nil)
    # all? [{|obj| block} ] → true or false
    # all?(pattern) → true or false
    case
    when block_given? && pattern.nil?   # {}
      each do |item|
        return false unless yield(item)
      end
    when !pattern.nil? && !block_given? # ()
      each do |item|
        return false unless pattern === item
      end
    when pattern.nil? && !block_given?  # empty
      each do |item|
        return false unless item
      end
    else # () {}
      raise ArgumentError, 'Expected one parameter: either pattern, either block'
    end
    true
  end

  def my_any?(pattern = nil)
    # any? [{|obj| block} ] → true or false
    # any?(pattern) → true or false
    case
    when block_given? && pattern.nil?   # {}
      each do |item|
        return true if yield(item)
      end
    when !pattern.nil? && !block_given? # ()
      each do |item|
        return true if pattern === item
      end
    when pattern.nil? && !block_given?  # empty
      each do |item|
        return true if item
      end
    else # () {}
      raise ArgumentError, 'Expected one parameter: either pattern, either block'
    end
    false
  end

  def my_none?(pattern = nil)
    # none? [{|obj| block} ] → true or false
    # none?(pattern) → true or false
    case
    when block_given? && pattern.nil?   # {}
      each do |item|
        return false if yield(item)
      end
    when !pattern.nil? && !block_given? # ()
      each do |item|
        return false if pattern === item
      end
    when pattern.nil? && !block_given?  # empty
      each do |item|
        return false if item
      end
    else # () {}
      raise ArgumentError, 'Expected one parameter: either pattern, either block'
    end
    true
  end

  def my_each
    # each {|item| block} → ary
    # each → Enumerator
    result_arr = []
    if block_given?                   # {}
      each do |item|
        result_arr << yield(item)
      end
    elsif !block_given?               # empty
     return self.to_enum(:each)
    else
      raise ArgumentError, 'Expected one parameter: block'
    end
    result_arr
  end

  def my_include?(arr)
    # include?(object) → true or false
    to_set.superset?(arr.to_set)
  end

  def my_map!()
    # map! {|item| block } → ary 
    # map! → Enumerator 
    result_arr = []
    if block_given? # {}
      each do |item|
        result_arr << yield(item)
      end
    else            # empty
      return self.to_enum(:each)
    end
  end

  def my_size
    # size → int
    return size
  end

  def my_count(value = nil)
    # count → int 
    # count(obj) → int
    # count {|item| block} → int 
    if block_given? && value.nil?      # {}
      each do |item|
        count += 1 if yield(item)

      end
    elsif !value.nil? && !block_given? # ()
      each do |item|
        count += 1 if value == item

      end
    elsif value.nil? && !block_given?  # empty
      return size
    else
      raise ArgumentError, 'Expected one parameter: either object, either block'
    end
    count
  end

  def my_length
    # length → int
    size
  end

  def my_select
    # select {|item| block} → new_ary
    # select → Enumerator 
    result = []
    if block_given? # {}
      each do |item|
        result << item if yield(item)
        
      end
    else            # empty
      return self.to_enum(:each)
    end
    result
  end

  # def my_find(ifnone = nil)
  #   # enum.find(ifnone = nil)   {| obj | block }  => obj or nil
  #   if !value.nil?
  #     while i < size
  #       return self[i] if self[i] == value

  #       i += 1
  #     end
  #   elsif block_given?
  #     while i < size
  #       return self[i] if yield(self[i])

  #       i += 1
  #     end
  #   else
  #     p 'No condition given'
  #   end
  # end

  def my_find_all
    # enum.find_all {| obj | block }  => array
    result = []
    if block_given? # {}
      each do |item|
        result << item if yield(item)

      end
    else            # empty
      raise ArgumentError, 'Expected one parameter: block'
    end
    result
  end

  def my_find_index(obj = nil)
    # find_index(obj) → int or nil
    # find_index {|item| block} → int or nil
    # find_index → Enumerator
    index = nil
    if !obj.nil? && !block_given?   # ()
      each_with_index do |item, i|
        return i if obj == item

      end
    elsif block_given? && obj.nil?  # {}
      each_with_index do |item, i|
        return i if yield(item)

      end
    elsif !block_given? && obj.nil? # empty
      return self.to_enum(:each)
    else
      raise ArgumentError, 'Expected one parameter: either obj, either block'
    end
    return nil
  end

  def my_reject*()
    # reject {|item| block } → new_ary
    # reject → Enumerator 
    result = self
    if block_given? # {}
      each_with_index do |item, i|
        result.delete_at(i) if yield(item)

      end
    else            # empty
      return self.to_enum(:each)
    end
    result
  end

  def my_min
    min_el = self[0]
    i = 1
    while i < size
      min_el = self[i] if min > self[i]

      i += 1
    end
    min_el
  end

  def my_max
    max_el = self[0]
    i = 1
    while i < size
      max_el = self[i] if min < self[i]

      i += 1
    end
    max_el
  end
end

class Array
  include MyEnumerable
end
