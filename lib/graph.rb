require 'ostruct'
# Representation of the Directed weighted graph
class Graph
  attr_reader :nodes, :edges

  def initialize(nodes = nil, edges = nil)
    @nodes = nodes || {}
    @edges = edges || {}
  end

  # XXX: doesn't make sense
  def add_node(node)
    @nodes[node.key] = node
  end

  def add_edge(predecessor, successor)
    add_node(predecessor)
    add_node(successor)
    @edges[predecessor.key] = {}
    @edges[predecessor.key][successor.key] = 1 + edge_weight(predecessor,successor)
  end

  def edge_weight(predecessor,successor)
    @nodes[predecessor.key][successor.key]
  end
end
