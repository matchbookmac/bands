require 'spec_helper'

describe Band do
  it { should have_and_belong_to_many :venues }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it 'titleizes the name of the band' do
    band = Band.create name: 'red fang'
    expect(band.name).to eq 'Red Fang'
  end

  describe '#unplayed_venues' do
    it 'returns an array of unplayed_venues' do
      venue_0 = Venue.create name: 'Slabtown', location: 'Portland, OR'
      venue_1 = Venue.create name: 'kingston mines', location: 'chicago, il'
      band = Band.create name: 'red fang'
      band.venues.push(venue_0)
      expect(band.unplayed_venues).to eq([venue_1])
    end
  end
end
