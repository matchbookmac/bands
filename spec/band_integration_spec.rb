require 'spec_helper'

describe 'the Band path', type: :feature do
  it 'will visit the homepage and navigate to prompt to enter a band because there are no bands yet' do
    visit '/'
    click_on 'bands'
    expect(page).to have_content 'Sorry, there are no bands. Try adding one below!'
  end

  it 'will visit the bands and add a band' do
    visit '/bands'
    click_on 'add_new_band'
    fill_in 'band_name', with: 'Red Fang'
    click_on 'add_band'
    expect(page).to have_content 'Red Fang'
  end

  it 'will visit the bands, select a band, and navigate to its page' do
    band = Band.create name: 'red fang'
    visit '/bands'
    click_on 'Red Fang'
    expect(page).to have_content 'Red Fang'
    expect(page).to have_content 'Sorry, this band hasn\'t played any venues. Try adding one below!'
  end

  describe 'Update and delete bands' do
    it 'will add venues to a band' do
      band = Band.create name: 'red fang'
      venue = Venue.create name: 'kingston mines', location: 'chicago, il'
      visit "/bands/#{band.id}"
      check venue.id
      click_on 'add_venues'
      expect(page).to have_content 'Kingston Mines'
    end

    it 'will update a band\'s name' do
      band = Band.create name: 'red fang'
      visit "/bands/#{band.id}"
      fill_in 'new_band_name', with: 'Blue Fang'
      click_on 'update_band'
      expect(page).to have_content 'Blue Fang'
    end

    it 'will delete a band' do
      band_0 = Band.create name: 'red fang'
      band_1 = Band.create name: 'Muddy Waters'
      visit "/bands/#{band_0.id}"
      click_on 'delete_band'
      expect(page).to_not have_content 'Red Fang'
    end
  end
end
