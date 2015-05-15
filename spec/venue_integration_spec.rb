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
    expect(page).to have_content 'Kingston Mines, Chicago, Il'
  end
end
