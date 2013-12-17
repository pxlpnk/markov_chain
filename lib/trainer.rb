class Trainer
  attr_reader :graph


  def initialize(graph)
    @graph = graph || Graph.new
  end

  def train(sentences)
    sentences.each do |sentence|
      words = sentence_to_words(sentence)
      words.each_with_index do |word, index|
        next_word = words[index+1]
        add_word_to_graph(word, next_word)
      end
    end
  end

  def add_word_to_graph(word,next_word)
    if next_word
      n1 = make_node(word)
      n2 = make_node(next_word)
      edge = Edge.new(n1,n2)
      @graph.add_edge(edge)
    end
  end

  def sentence_to_words(sentence)
    sentence.split(' ')
  end

  def make_node(word)
    Node.new(word.to_sym => word)
  end
end
