require 'ostruct'
# Representation of the Directed weighted graph
class Graph
  attr_reader :nodes, :edges

  def initialize(nodes: nil, edges: nil)
    @nodes = nodes || {}
    @edges = edges || {}
  end

  def add_edge(edge)
    key = edge.key
    if @edges.key?(key)
      edge = get_edge(key)
      edge.increment
    end

    @edges[key] = edge
  end

  def get_edge(key)
    @edges.key?(key) ?  @edges[key] : nil
  end

  def get_edge_weight(edge)
    @edges[edge.predecessor].weight
  end

  def add_nodes_from_edge(edge)
    edge.nodes.each do |node|
      @nodes[node.key] = node
    end
  end
end
