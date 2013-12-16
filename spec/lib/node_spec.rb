require 'spec_helper'
require 'node'
describe Node do
  subject { Node.new(key: 'value') }
  it { should respond_to(:key) }
  it { should respond_to(:value) }
  its(:key) { should == :key }
  its(:value) { should == 'value' }

  describe 'is comparable' do
    it 'with two key, values' do
      n1 = Node.new(key: 'value')
      n2 = Node.new(key: 'value')
      expect(n1).to equal n2
    end
  end
end
