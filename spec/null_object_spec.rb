require 'spec_helper'

describe NullObject do
  describe '#method_missing' do
    it 'will return self when called on a null object' do
      null = NullObject.new
      expect(null.method_missing).to eq null
    end
  end

  describe '#downcase' do
    it 'will return nil' do
      null = NullObject.new
      expect(null.downcase).to eq nil
    end
  end

  describe '#titleize' do
    it 'will return nil' do
      null = NullObject.new
      expect(null.titleize).to eq nil
    end
  end
end
