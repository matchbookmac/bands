require 'spec_helper'

describe 'the Venue path', type: :feature do
  it 'will visit the homepage and navigate to prompt to enter a venue because there are no venues yet' do
    visit '/'
    click_on 'venues'
    expect(page).to have_content 'Sorry, there are no venues. Try adding one below!'
  end
  it 'will visit the venues and add a venue' do
    visit '/venues'
    click_on 'add_new_venue'
    fill_in 'venue_name', with: 'Kingston Mines'
    fill_in 'venue_location', with: 'Chicago, IL'
    click_on 'add_venue'
    expect(page).to have_content 'Kingston Mines, Chicago, IL'
  end

  describe 'Update venues' do
    it 'will add bands to a venue' do
      band = Band.create name: 'red fang'
      venue = Venue.create name: 'kingston mines', location: 'chicago, il'
      visit "/venues/#{venue.id}"
      check band.id
      click_on 'add_bands'
      expect(page).to have_content 'Red Fang'
    end

    it 'will update a venue\'s name' do
      venue = Venue.create name: 'kingston mines'
      visit "/venues/#{venue.id}"
      fill_in 'new_venue_name', with: 'Slabtown'
      click_on 'update_venue'
      expect(page).to have_content 'Slabtown'
    end
  end
end
