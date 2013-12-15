require 'ostruct'

# Describes the node structure
class Node < OpenStruct
  attr_reader :key, :value

  def initialize(key_value_pair)
    @key = key_value_pair.keys.first
    @value = key_value_pair[@key]
  end
end
