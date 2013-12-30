require 'spec_helper'
require 'markov_chain/node'
# MarkovChain::Node
module MarkovChain
  describe Node do
    subject { Node.new(:key, 'value') }
    it { should respond_to :key }
    it { should respond_to :value }

    its(:key) { should == :key }
    its(:value) { should == 'value' }
  end
end
