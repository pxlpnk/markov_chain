# To train the markov chain data graph
module MarkovChain
  class Trainer

    attr_reader :graph

    def initialize(graph = nil)
      @graph = graph || Graph.new
    end

    def train(sentences)
      sentences.each do |sentence|
        words = words_from_sentence sentence
        words.each_cons(2) do |predecessor, successor|
          add_edge_to_graph(predecessor,successor)
        end
      end
      @graph
    end

    def add_edge_to_graph(predecessor_word, successor_word)
      predecessor = Node.new(predecessor_word.to_sym, predecessor_word)
      successor = Node.new(successor_word.to_sym, successor_word)
      edge = Edge.new(predecessor, successor)
      @graph.add(edge)
    end

    def words_from_sentence(sentence)
      sentence.split(' ')
    end
  end
end
