require 'spec_helper'

describe 'the Error path', type: :feature do
  it 'will visit the venues and add a blank venue and return errors' do
    venue = Venue.create name: 'kingston mines', location: 'chicago, il'
    visit '/venues'
    click_on 'add_new_venue'
    fill_in 'venue_name', with: 'Kingston Mines'
    fill_in 'venue_location', with: 'Chicago, IL'
    click_on 'add_venue'
    expect(page).to have_content 'Yo, chill Name has already been taken'
  end
end
