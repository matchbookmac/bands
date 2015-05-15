require 'spec_helper'

  describe 'Maybe' do
    it 'returns NullObject when the object passed is nill' do
      null_class = Maybe(nil)
      expect(null_class.class).to eq(NullObject.new.class)
    end

    it 'returns the object if the object is not nil' do
      band = Band.create name: 'red fang'
      expect(Maybe(band)).to eq band
    end
  end
