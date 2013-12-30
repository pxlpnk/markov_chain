require 'markov_chain/node'

module MarkovChain
  # Describes the Edge
  class Edge
    attr_reader :predecessor, :successor, :weight

    def initialize(predecessor, successor, weight = 1)
      @predecessor = predecessor
      @successor = successor
      @weight = weight
    end

    def nodes
      [@predecessor, @successor]
    end

    def predecessor_key
      @predecessor.key
    end

    def successor_key
      @successor.key
    end

    def increment_weight
      @weight = @weight + 1
    end
  end
end
