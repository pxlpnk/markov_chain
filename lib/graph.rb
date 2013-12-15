require 'ostruct'
# Representation of the Directed weighted graph
class Graph
  attr_reader :nodes, :edges

  def initialize(nodes: nil, edges: nil)
    @nodes = nodes || {}
    @edges = edges || {}
  end

  def add_edge(edge)
    if(edge1 = get_edge(edge.key))
      edge1.increment
      @edges[edge1.key] = edge1
    else
      @edges[edge.key] = edge
    end
  end


  def get_edge(key)
    @edges.key?(key) ?  @edges[key] : nil
  end

  def get_edge_weight(edge)
    @edges[edge.predecessor].weight
  end

  def add_nodes_from_edge(edge)
#    require 'pry'; binding.pry
    edge.nodes.each do |node|
      @nodes[node.key] = node
    end
  end
end
