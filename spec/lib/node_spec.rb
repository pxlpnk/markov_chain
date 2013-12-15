require 'node'
describe Node do
  subject { Node.new(key: 'value') }
  it { should respond_to(:key) }
  it { should respond_to(:value) }
  its(:key) { should == :key }
  its(:value) { should == 'value' }
end
