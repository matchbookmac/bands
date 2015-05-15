require 'spec_helper'

describe Band do
  it { should have_and_belong_to_many :venues }

  # it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it 'titleizes the name of the band' do
    band = Band.create name: 'red fang'
    expect(band.name).to eq 'Red Fang'
  end
end
