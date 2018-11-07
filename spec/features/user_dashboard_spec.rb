require 'rails_helper'

describe 'An authenticated user on their dashboard' do
  before :each do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    @movie = "Interstellar"
    movie_json_response = File.open('./fixtures/movie_search.json')
    stub_request(:get, "https://tastedive.com/api/similar?q=#{@movie}&k=#{ENV['TASTEDIVE_API_KEY']}&verbose=1&info&limit=5").to_return(status: 200, body: movie_json_response)

    weather_json_response = File.open('./fixtures/weather_search.json')
    stub_request(:get, "http://api.apixu.com/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=80002&days=7").to_return(status: 200, body: weather_json_response)
  end
  
  scenario 'can successfully search for movie and weather recommendations' do
    visit dashboard_path
    fill_in :movie, with: @movie
    fill_in :zipcode, with: '80002'
    click_button 'Submit'
    
    expect(current_path).to eq('/search')
    expect(page).to have_css(".movie", count: 20)
    within(first(".movie")) do
      expect(page).to have_css(".movie-title")
      expect(page).to have_css("#video")
      expect(page).to have_css("#summary")
    end

    expect(page).to have_css(".condition", count: 7)
    within(first(".condition")) do
      expect(page).to have_css(".day")
      expect(page).to have_css(".description")
      expect(page).to have_css(".temperatures")
      expect(page).to have_css(".moonrise")
    end
  end
end 

describe 'A unauthenticated visitor' do
  scenario 'cannot access the user dashboard' do
    visit dashboard_path
    expect(current_path).to eq('/')
    expect(page).to have_button('Sign in with Google')
    expect(page).to_not have_button('Sign Out')
  end
   scenario 'cannot access user search' do
    visit search_path
    expect(current_path).to eq('/')
    expect(page).to have_button('Sign in with Google')
    expect(page).to_not have_button('Sign Out')
  end
end

