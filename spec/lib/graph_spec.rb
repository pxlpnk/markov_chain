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
  describe 'adding nodes' do
    let(:graph) { Graph.new }
    subject { graph }
    it 'lets you add a single node' do
      node = double('node', key: 'key')
      graph.add_node(node)
      expect(graph.nodes).to include(node.key)
    end

    it 'influences the graph'
  end
end
