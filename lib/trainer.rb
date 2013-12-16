class Trainer

  def train(graph, sentences)
    sentences.each do |sentence|
      words(sentence).each do |word|

      end
    end
  end

  def words(sentence)
    sentence.split(' ')
  end

  def make_node(word)
    Node.new(word.to_sym => word)
  end
end
