require 'spec_helper'
require 'markov_chain/edge'
# MarkovChain::Edge
module MarkovChain
  describe Edge do
    let(:predecessor) { double('predecessor', key: :key1) }
    let(:successor) { double('successor', key: :key2) }

    subject { Edge.new(predecessor, successor) }

    it { should respond_to :weight }
    it { should respond_to :predecessor }
    it { should respond_to :successor }

    its(:predecessor) { should be predecessor }
    its(:successor) { should be successor }
    its(:weight) { should be 1 }
    its(:nodes) { should eq [predecessor, successor] }
    its(:predecessor_key) { should eq predecessor.key }
    its(:successor_key) { should eq successor.key }

    it '#increment_weight' do
      expect { subject.increment_weight }.to change { subject.weight }.by(1)
    end
  end
end
