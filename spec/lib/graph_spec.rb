require 'spec_helper'
require 'graph'
require 'edge'

describe Graph do
  describe 'created without params' do
    its(:edges) { should be_empty }
    its(:nodes) { should be_empty }
  end

  describe 'created with edges' do
    let(:edges) { double('edges', empty?: false) }
    subject { Graph.new(edges: edges) }
    its(:edges) { should_not be_empty }
  end

  describe 'created with nodes' do
    let(:nodes) { double('nodes', empty?: false) }
    subject { Graph.new(nodes: nodes) }
    its(:nodes) { should_not be_empty }
  end

  describe '#add_edge' do
    before { pending }

    let(:edge) { double('Edge', predecessor_key: :key1, successor_key: :key2, key: :key1, weight: 1) }
    subject { Graph.new }

    it 'to the edges-list' do
      subject.add_edge(edge)
      expect(subject.edges).to include :key1
    end

    it 'when edge exists, increments the weight from 1 to 2' do
      subject.add_edge(edge)
      subject.add_edge(edge)
      expect(subject.get_edge_weight(edge)).to eq 2
    end

    it 'when not exsting, adds the edge with weight 1' do
      subject.add_edge(edge)
      expect(subject.get_edge_weight(edge.key)).to eq 1
    end

    it 'returns the added edge' do
      expect(subject.add_edge(edge)).to eql edge
    end
  end

  describe '#add_nodes_from_edge' do
    let(:node1) { double('node1', key: :key1) }
    let(:node2) { double('node2', key: :key2) }
    let(:edge) { Edge.new(node1, node2) }
    subject { Graph.new }

    it 'fills up the @nodes' do
      subject.add_nodes_from_edge(edge)
      expect(subject.nodes).to_not be_empty
      expect(subject.nodes).to include :key1
      expect(subject.nodes).to include :key2
    end
  end

  describe '#edge_weight' do
    let(:edge) { double('edge', weight: 2, predecessor_key: :key1) }
    let(:edges) { double('edges', :[] => edge) }
    subject { Graph.new(edges: edges) }

    it 'returns the weight of an existing edge' do
      pending
      expect(subject.get_edge_weight(edge)).to eq 2
    end
  end

  describe '#get_edge' do
    let(:edge) { double('edge', weight: 2, predecessor: double('node')) }
    subject { Graph.new }
    it 'returns nil if the edge is not found' do
      expect(subject.get_edge(edge)).to be_nil
    end

    it 'returns the edge when found' do
      edge =  double('edge', weight: 2, predecessor: double('node'))
      edges = double('edges', key?: true, :[] => edge)
      graph = Graph.new(edges: edges)

      expect(graph.get_edge(edge)).to eq edge
    end
  end
end
