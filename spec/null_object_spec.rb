require 'spec_helper'

describe NullObject do
  describe '#method_missing' do
    it 'will return self when called on a null object' do
      null = NullObject.new
      expect(null.method_missing).to eq null
    end
  end

  describe '#titleize' do
    it 'will return nil' do
      null = NullObject.new
      expect(null.titleize).to eq nil
    end
  end

  describe '#upcase' do
    it 'will return nil' do
      null = NullObject.new
      expect(null.upcase).to eq nil
    end
  end
end
