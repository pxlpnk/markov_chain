require 'spec_helper'
require 'edge'
require 'node'

describe Edge do
  let(:predecessor) { Node.new(key1: 'predecessor') }
  let(:successor) { Node.new(key2: 'successor') }
  let(:edge) { Edge.new(predecessor, successor) }
  subject { edge }

  its(:predecessor) { should be predecessor }
  its(:successor) { should be successor }
  its(:weight) { should == 1 }

  its(:keys) { should == %i( key1 key2) }
  its(:key) { should == :key1 }
  its(:nodes) { should == [predecessor, successor] }

  its(:predecessor_key) { should == :key1 }
  its(:successor_key) { should == :key2 }

  it 'increments the weight by one' do
    expect(edge.increment).to eq 2
    expect(edge.weight).to eq 2
  end
end
