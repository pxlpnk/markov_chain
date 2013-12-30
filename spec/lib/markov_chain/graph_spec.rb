require 'spec_helper'
require 'markov_chain/graph'

# MarkovChain::Graph
module MarkovChain
  describe Graph do

    it { should respond_to :add }
    it { should respond_to :has_edge? }
    it { should respond_to :edge? }

    context 'When fresh created' do
      subject { Graph.new }
      its(:edges) { should be_empty }
      its(:nodes) { should be_empty }
    end

    context '#add_to_nodes' do
      subject(:graph) { Graph.new }
      let(:predecessor) { double('predecessor', key: :key1) }
      let(:successor) { double('successor', key: :key2) }

      it 'adds the predecessor' do
        edge = double('edge')
        expect(edge).to receive(:nodes).and_return([predecessor, successor])

        graph.add_to_nodes(edge)
        expect(graph.nodes).to have_key :key1
      end

      it 'adds the successor' do
        edge = double('edge')
        expect(edge).to receive(:nodes).and_return([predecessor, successor])

        graph.add_to_nodes(edge)
        expect(graph.nodes).to have_key :key2
      end
    end

    context '#add_to_edges' do
      subject(:graph) { Graph.new }

      it 'adds the edge to the graph when not existing' do
        edge = double(edge,
                      predecessor_key: :key1,
                      successor_key: :key2)

        graph.add_to_edges(edge)
        expect(graph).to have_edge edge
      end

      it 'increments the weight by 1 when edge exists' do

        edge = double('edge')

        expect(edge)
        .to receive(:predecessor_key).at_least(12).times.and_return(:key1)
        expect(edge)
        .to receive(:successor_key).at_least(7).times.and_return(:key2)
        expect(edge).to receive(:increment_weight)
        expect(edge).to receive(:weight).and_return(2)

        graph.add_to_edges(edge)
        graph.add_to_edges(edge)
        expect(graph.get_edge(edge).weight).to be 2
      end
    end

    context '#edge?' do
      subject(:graph) { Graph.new }
      let!(:edge) do
        double('edge',
               predecessor_key: :key1,
               successor_key: :key2)
      end

      it 'is true when an edge exists' do
        edges = { key1: { key2: edge } }
        graph.edges = edges

        expect(graph).to have_edge(edge)
      end

      it 'is false when an edge does not exist' do
        edges = { key1: { key3: edge } }
        graph.edges = edges

        expect(graph).to_not have_edge(edge)
      end
    end

    context '#get_edge' do
      # TODO: test
    end
  end
end
