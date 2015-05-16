require 'spec_helper'

describe Venue do
  it { should have_and_belong_to_many :bands }

  it { should validate_presence_of :name}

  it { should validate_presence_of :location}

  it { should validate_uniqueness_of :name}

  it 'titleizes the name of the venue' do
    venue = Venue.create name: 'kingston mines'
    expect(venue.name).to eq 'Kingston Mines'
  end

  it 'titleizes the location of the venue' do
    venue = Venue.create name: 'kingston mines', location: 'chicago, il'
    expect(venue.location).to eq 'Chicago, IL'
  end

  describe '#unplayed_bands' do
    it 'returns an array of unplayed_bands' do
      band_0 = Band.create name: 'Red Fang'
      band_1 = Band.create name: 'Muddy Waters'
      venue = Venue.create name: 'Slabtown', location: 'Portland, OR'
      venue.bands.push(band_0)
      expect(venue.unplayed_bands).to eq([band_1])
    end
  end
end
