require 'spec_helper'

describe 'the Venue path', type: :feature do
  it 'will visit the homepage and navigate to prompt to enter a venue because there are no venues yet' do
    visit '/'
    click_on 'Venue'
    expect(page).to have_content 'Sorry, there are no venues. Try adding one below!'
  end
end
