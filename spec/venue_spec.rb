require 'spec_helper'

describe Venue do
  it { should have_and_belong_to_many :bands }

  it { should validate_presence_of :name}

  it { should validate_uniqueness_of :name}

  it 'titleizes the name of the venue' do
    venue = Venue.create name: 'kingston mines'
    expect(venue.name).to eq 'Kingston Mines'
  end

  it 'titleizes the location of the venue' do
    venue = Venue.create name: 'kingston mines', location: 'chicago'
    expect(venue.location).to eq 'Chicago'
  end
end
