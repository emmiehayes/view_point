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
  end
end
