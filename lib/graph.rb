require 'ostruct'
# Representation of the Directed weighted graph
class Graph
  attr_reader :nodes, :edges

  def initialize(nodes: nil, edges: nil)
    @nodes = nodes || {}
    @edges = edges || {}
  end

  def add_edge(edge)
    @edges[edge.predecessor_key] = {} if @edges[edge.predecessor_key].nil?
    increment_edge_weight(edge)
    @edges[edge.predecessor_key][edge.successor_key] = edge
  end

  def increment_edge_weight(edge)
    if @edges.key?(edge.predecessor_key)
      edge.increment
    end
  end

  def get_edge(key)
    @edges.key?(key) ?  @edges[key] : nil
  end

  def get_edge_weight(edge)
    @edges[edge.predecessor_key][edge.successor_key].weight
  end

  def add_nodes_from_edge(edge)
    edge.nodes.each do |node|
      @nodes[node.key] = node
    end
  end
end
