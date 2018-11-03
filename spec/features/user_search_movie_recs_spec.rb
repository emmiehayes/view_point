require 'rails_helper'

describe 'An authenticated user' do
  scenario 'can successfully search for movie recommendations' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    movie = "Interstellar"

    json_response = File.open('./fixtures/movie_search.json')
    stub_request(:get, "https://tastedive.com/api/similar?q=#{movie}&k=#{ENV['TASTEDIVE_API_KEY']}&verbose=1&info").to_return(status: 200, body: json_response)

    visit dashboard_path
    fill_in :search, with: movie
    click_button 'Search'
    
    expect(current_path).to eq('/search')
    expect(page).to have_css(".movie", count: 20)

    within(first(".movie")) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".summary")
      expect(page).to have_css(".trailer")
    end
  end
end
