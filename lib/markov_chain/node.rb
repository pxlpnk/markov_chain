module MarkovChain
  # representation of a node
  class Node
    attr_reader :key, :value

    def initialize(key, value)
      @key = key
      @value = value
    end
  end
end
