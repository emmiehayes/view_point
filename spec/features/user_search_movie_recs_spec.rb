require 'rails_helper'

describe 'An authenticated user' do
  scenario 'can successfully search for movie recommendations' do

    user = create(:user)
    ApplicationController.stub(:current_user).and_return(User.first)

    movie_name = "Interstellar"
    
    visit dashboard_path
    expect(page).to have_css("input", :maximum => 1)

    fill_in 'Favorite_Movie', with: movie_name
    click_button 'Search'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_css(".movies", :count => 3)
  end
end
