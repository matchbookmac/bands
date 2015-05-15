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
end
