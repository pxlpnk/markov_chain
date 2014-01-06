module MarkovChain
  # MarkovChain::Graph data structure
  class Creator
    attr_reader :graph

    def initialize(graph)
      @graph = graph
    end

    def create_sentence(successor, length = 5)
      sentence = [successor]
      (1..length).each do |n|
        edges = @graph.successor_with(successor)
        edge = edges[0..5].shuffle.first.last
        successor = edge.successor_key
        sentence << successor
      end

      sentence
    end
  end
end
