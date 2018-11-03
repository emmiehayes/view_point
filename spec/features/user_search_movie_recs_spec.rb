require 'rails_helper'

describe 'An authenticated user' do
  scenario 'can successfully search for movie recommendations' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    movie_name = "Interstellar"
    
    visit dashboard_path

    fill_in :search, with: movie_name
    click_button 'Search'

    expect(current_path).to eq('/search')
    expect(page).to have_css(".movie", count: 20)

    within(first(".movie")) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".poster")
      expect(page).to have_css(".summary")
    end
  end
end
