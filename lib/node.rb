require 'ostruct'

# Describes the node structure
class Node
  include Comparable

  attr_reader :key, :value

  def initialize(key_value_pair)
    @key = key_value_pair.keys.first
    @value = key_value_pair[@key]
  end

  def ==(other)
    if(@key == other.key && @value == other.value)
      0
    else
      1
    end
  end
end
