# describing the Edge data structure

class Edge
  attr_reader :weight, :predecessor, :successor

  def initialize(predecessor, successor, weight = 1)
    @predecessor = predecessor
    @successor = successor
    @weight = weight
  end

  def keys
    [@predecessor.key, @successor.key]
  end

  def nodes
    [@predecessor, @successor]
  end

  def increment
    @weight = @weight + 1
  end

  def key
    predecessor.key
  end

  def predecessor_key
    predecessor.key
  end

  def successor_key
    successor.key
  end
end
