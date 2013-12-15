require 'ostruct'
# Representation of the Directed weighted graph
class Graph
  attr_reader :nodes

  def initialize(nodes = nil)
    @nodes = nodes || {}
  end

  def add_node(node)
    @nodes[node.key] = node
  end
end
