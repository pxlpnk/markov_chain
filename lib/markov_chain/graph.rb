module MarkovChain
  # MarkovChain::Graph data structure
  class Graph
    attr_accessor :edges, :nodes

    def initialize
      @edges = {}
      @nodes = {}
    end

    def add(edge)
      add_to_nodes(edge)
      add_to_edges(edge)
    end

    def edge?(edge)
      @edges.key?(edge.predecessor_key) &&
        @edges[edge.predecessor_key].key?(edge.successor_key)
    end
    alias_method :has_edge?, :edge?

    def add_to_nodes(edge)
      predecessor, successor = edge.nodes
      @nodes[predecessor.key] = predecessor
      @nodes[successor.key] = successor
    end

    def add_to_edges(edge)
      if has_edge?(edge)
        edge = increment_edge(edge)
      elsif has_predecessor?(edge)
        # intetionally left blank
      else
        @edges[edge.predecessor_key] = {}
      end

      @edges[edge.predecessor_key][edge.successor_key] = edge

      @edges
    end

    def increment_edge(edge)
      edge = get_edge(edge)
      edge.increment_weight
      edge
    end

    def successor?(edge)
      predecessor = @edges.fetch(edge.predecessor_key)
      predecessor.fetch(edge.successor_key)
      true
    rescue KeyError
      false
    end
    alias_method :has_successor?, :successor?

    def predecessor?(edge)
      @edges.fetch(edge.predecessor_key)
    rescue KeyError
      false
    end
    alias_method :has_predecessor?, :predecessor?

    def get_edge(edge)
      has_edge?(edge) ? @edges[edge.predecessor_key][edge.successor_key] : nil
    end

    def successor_with(predecessor, selector = lambda{ |x| x > 0})
      edges = @edges[predecessor] || []
      sorted = edges.sort_by { |k,v| v.weight }.reverse!
      sorted.select{ |edge| selector.call(edge.last.weight) }
    end

    def biggest_successor(predecessor)
      edges = successor_with(predecessor)
      edges.first
    end

    def smallest_sucessor(predecessor)
      edges = successor_with(predecessor)
      edges.last
    end

    def weights(node)
      weights = {}
      @edges[node.key].each do |key, edge|
        weights.merge!(key => edge.weight)
      end
      weights.sort_by { |_k, weight| weight }
    end
  end
end
