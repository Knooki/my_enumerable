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
    else                               # () {}
        raise StandardError.new 'Expected one parameter: either pattern, either block'
    end
    true
  end

  def my_any?(value = nil)
    i = 0
    if !value.nil?
      while i < size
        return true if self[i] == value

        i += 1
      end
    elsif block_given?
      while i < size
        return true if yield(self[i])

        i += 1
      end
    else
      while i < size
        return true if self[i]

        i += 1
      end
    end
    false
  end

  def my_none?(value = nil)
    i = 0
    if !value.nil?
      while i < size
        return false if self[i] == value

        i += 1
      end
    elsif block_given?
      while i < size
        return false if yield(self[i])

        i += 1
      end
    else
      while i < size
        return false if self[i]

        i += 1
      end
    end
    true
  end

  def my_each(value = nil)
    i = 0
    if !value.nil?
      while i < size
        self[i] = value
        i += 1
      end
      self
    elsif block_given?
      while i < size
        yield(self[i])
        i += 1
      end
      self
    else
      while i < size
        p "Current number is #{self[i]}"
        i += 1
      end
    end
  end

  def my_include?(arr)
    to_set.superset?(arr.to_set)
  end

  def my_map(value = nil)
    i = 0
    result = self
    if !value.nil?
      while i < size
        result[i] = value
        i += 1
      end
    elsif block_given?
      while i < size
        yield(result[i])
        i += 1
      end
    else
      p 'No action given'
    end
    result
  end

  def my_size
    size
  end

  def my_count(value = nil)
    count = value
    i = 0
    if block_given?
      while i < size
        count += 1 if yield(self[i])

        i += 1
      end
    elsif !value.nil?
      while i < size
        count += 1 if value == self[i]

        i += 1
      end
      count += value
    else
      return size
    end
    count
  end

  def my_length
    size
  end

  def my_select
    i = 0
    result = []
    if block_given?
      result.append(self[i]) if yield(self[i])
    else
      p 'No action given'
    end
    result
  end

  def my_find(value = nil)
    i = 0
    if !value.nil?
      while i < size
        return self[i] if self[i] == value

        i += 1
      end
    elsif block_given?
      while i < size
        return self[i] if yield(self[i])

        i += 1
      end
    else
      p 'No condition given'
    end
  end

  def my_find_all(value = nil)
    i = 0
    result = []
    if !value.nil?
      while i < size
        result.append(self[i]) if self[i] == value

        i += 1
      end
    elsif block_given?
      while i < size
        result.append(self[i]) if yield(self[i])

        i += 1
      end
    else
      p 'No condition given'
    end
    result
  end

  def my_find_index(value = nil)
    i = 0
    if !value.nil?
      while i < size
        return i if self[i] == value

        i += 1
      end
    elsif block_given?
      while i < size
        return i if yield(self[i])

        i += 1
      end
    else
      p 'No condition given'
    end
  end

  def my_reject(value = nil)
    i = 0
    result = self
    if !value.nil?
      while i < size
        result.delete_at(i) if self[i] == value

        i += 1
      end
    elsif block_given?
      while i < size
        result.delete_at(i) if yield(self[i])

        i += 1
      end
    else
      p 'No condition given'
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
