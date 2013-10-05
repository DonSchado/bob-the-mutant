require 'spec_helper'
require 'statement'

describe Statement do
  it { expect(Statement.new(42).sentence).to be_kind_of(String) }
  it { expect(Statement.new(nil).sentence).to be_empty }

  describe '#meaningless' do
    it { expect(Statement.new('')).to be_meaningless }
    it { expect(Statement.new('Foo')).to_not be_meaningless }
  end

  describe '#asking' do
    it { expect(Statement.new('Bar?')).to be_asking }
    it { expect(Statement.new('?Bar')).to_not be_asking }
  end

  describe '#shouting' do
    it { expect(Statement.new('AAARGH!!!')).to be_shouting }
    it { expect(Statement.new('aaargh!!!')).to_not be_shouting }
  end
end