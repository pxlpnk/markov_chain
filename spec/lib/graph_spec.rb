require 'graph'
describe Graph do
  describe 'creating a graph' do
    it 'accepts an existing hash as parameter' do
      nodes = double('nodes', empty?: false)
      graph = Graph.new(nodes)
      expect(graph.nodes).to eq nodes
      expect(graph.nodes).to_not be_empty
    end

    it  'creates an empty graph when there is no parameter' do
      graph = Graph.new
      expect(graph.nodes).to be_empty
    end
  end
  describe 'adding elements' do
    let(:graph) { Graph.new }
    subject { graph }

    it 'lets you add a single node' do
      node = double('node', key: 'key')
      graph.add_node(node)
      expect(graph.nodes).to include(node.key)
    end

    describe 'adding an edge' do
      let(:graph) { Graph.new }
      subject { graph }

      let(:node1) { double('node1', key: 'key1') }
      let(:node2) { double('node2', key: 'key2') }

      it 'lets you add an edge(two nodes)' do
        node1.should_receive(:[]).with('key2').and_return(0)
        graph.add_edge(node1, node2)
      end

      it 'increments the weight by one'

      it 'returns the edge_weight'
    end
  end
end
