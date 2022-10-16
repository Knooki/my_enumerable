# frozen_string_literal: true

# all? any? include? none? each map size count length select find find_all find_index reject max min

require 'set'

# extension with my methods for Array class
module MyEnumerable
  def my_all?(pattern = nil)
    # all? [{|obj| block} ] → true or false
    # all?(pattern) → true or false
    warn("given block not used\n", uplevel: 1) if !pattern.nil? && block_given?
    if !pattern.nil? # ()
      each { |item| return false unless pattern === item }
    elsif block_given? # {}
      each { |item| return false unless yield(item) }
    else # empty
      each { |item| return false unless item }
    end
    true
  end

  def my_any?(pattern = nil)
    # any? [{|obj| block} ] → true or false
    # any?(pattern) → true or false
    warn("given block not used\n", uplevel: 1) if !pattern.nil? && block_given?

    if !pattern.nil? # ()
      each { |item| return true if pattern === item }
    elsif block_given? # {}
      each { |item| return true if yield(item) }
    else # empty
      each { |item| return true if item }
    end
    false
  end

  def my_none?(pattern = nil)
    # none? [{|obj| block} ] → true or false
    # none?(pattern) → true or false
    warn("given block not used\n", uplevel: 1) if !pattern.nil? && block_given?

    if !pattern.nil? # ()
      each { |item| return false if pattern === item }
    elsif block_given? # {}
      each { |item| return false if yield(item) }
    else # empty
      each { |item| return false if item }
    end
    true
  end

  def my_each(&block)
    # each {|item| block} → ary
    # each → Enumerator
    return to_enum(:my_each) unless block_given?

    each(&block)
    self
  end

  def my_include?(obj)
    # include?(object) → true or false
    each { |item| return true if item == obj }
    false
  end

  def my_map!
    # map! {|item| block } → ary
    # map! → Enumerator
    return to_enum(:my_map!) unless block_given?

    i = 0
    while i < size
      self[i] = yield(self[i])
      i += 1
    end
    self
  end

  def my_size
    # size → int
    size
  end

  def my_count(value = nil)
    # count → int
    # count(obj) → int
    # count {|item| block} → int
    warn("given block not used\n", uplevel: 1) if !value.nil? && block_given?
    count = 0
    if !value.nil? # ()
      each { |item| count += 1 if value == item }
    elsif block_given? # {}
      each { |item| count += 1 if yield(item) }
    else # empty
      return size
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
    return to_enum(:my_select) unless block_given?

    map { |item| item if yield(item) } - [nil]
  end

  def my_find(ifnone = nil)
    # enum.find(ifnone = nil)   {| obj | block }  => obj or nil
    return to_enum(:my_find, ifnone) unless block_given?

    each { |item| return item if yield(item) }
    ifnone.nil? ? nil : ifnone.call
  end

  def my_find_all
    # enum.find_all {| obj | block }  => array
    return to_enum(:my_find_all) unless block_given?

    map { |item| item if yield(item) } - [nil]
  end

  def my_find_index(obj = nil)
    # find_index(obj) → int or nil
    # find_index {|item| block} → int or nil
    # find_index → Enumerator
    warn("given block not used\n", uplevel: 1) if !obj.nil? && block_given?
    if !obj.nil? # ()
      (1..size).each { |i| return i if self[i] == obj }
    elsif block_given? # {}
      (1..size).each { |i| return i if yield(self[i]) }
    else # empty
      return to_enum(:my_find_index)
    end
    nil
  end

  def my_reject
    # reject {|item| block } → new_ary
    # reject → Enumerator
    return to_enum(:my_reject) unless block_given?

    map { |item| item unless yield(item) } - [nil]
  end

  def my_min(amount = nil, &block)
    # min → obj
    # min {| a,b | block } → obj
    # min(n) → array
    # min(n) {| a,b | block } → array
    if amount.nil?
      min_el = self[0]
      if block_given?
        each { |item| min_el = item if yield(item, min_el).negaite? }
      else
        each { |item| min_el = item if item < min_el }
      end
      min_el
    else
      arr = []
      (arr << self).flatten!
      (1..amount).map do
        tmp = arr.my_min(&block)
        arr.delete(tmp)
      end
    end
  end

  def my_max(amount = nil, &block)
    # min → obj
    # min {| a,b | block } → obj
    # min(n) → array
    # min(n) {| a,b | block } → array
    if amount.nil?
      max_el = self[0]
      if block_given?
        each { |item| max_el = item if yield(item, max_el).positive? }
      else
        each { |item| max_el = item if item > max_el }
      end
      max_el
    else
      arr = []
      (arr << self).flatten!
      (1..amount).map do
        tmp = arr.my_max(&block)
        arr.delete(tmp)
      end
    end
  end
end

class Array
  include MyEnumerable
end
