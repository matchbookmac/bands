require 'spec_helper'

describe 'the Band path', type: :feature do
  it 'will visit the homepage and navigate to prompt to enter a band because there are no bands yet' do
    visit '/'
    click_on 'Bands'
    expect(page).to have_content 'Sorry, there are no bands. Try adding one below!'
  end
end
