require 'spec_helper'
require 'trainer'

describe Trainer do
  describe '#train' do
    it 'takes a graph and a list of sentences' do
      graph = Graph.new
      sentences = ['Are we allowed to run over people?',
                   'Private Wiley inquires, and then mashes the horn button before Bobby Shaftoe can answer.',
                   'A Sikh policeman hurdles a night soil cart.']
      subject.train(sentences)
    end

  end

  describe '#make_node' do
    it 'creates a node from a word' do
      word = 'foo'
      node = Node.new(foo: 'foo')
      expect(subject.make_node(word)).to eq node
    end
  end

  describe '#sentence_to_words' do
    it 'splits a sentence into words' do
      sentence = 'Are we allowed to run over people?'
      words = %w(Are we allowed to run over people?)
      expect(subject.sentence_to_words(sentence)).to eql words
    end
  end

end
