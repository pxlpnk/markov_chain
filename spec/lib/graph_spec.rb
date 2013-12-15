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
    let(:node1) { double('node1', key: :key1) }
    let(:node2) { double('node2', key: :key2) }
    let(:edge) { Edge.new(node1, node2) }
    subject { Graph.new }

    it 'to the edges-list' do
      subject.add_edge(edge)
      expect(subject.edges).to include edge.key
    end

    it 'when edge exists, increments the weight by one' do
      subject.add_edge(edge)
      subject.add_edge(edge)
      expect(subject.get_edge(edge.key).weight).to eq 2
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
end
