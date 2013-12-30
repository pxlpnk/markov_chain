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
        edge = get_edge(edge)
        edge.increment_weight
      elsif !has_predecessor?(edge)
        @edges[edge.predecessor_key] = {}
      end

      @edges[edge.predecessor_key][edge.successor_key] = edge

      @edges
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
  end
end
