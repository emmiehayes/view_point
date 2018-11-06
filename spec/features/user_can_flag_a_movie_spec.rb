require 'rails_helper'

# describe 'An authenticated user on the search index' do
#   before :each do
#     user = create(:user)
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
#     @movie = "Interstellar"
#     json_response = File.open('./fixtures/movie_search.json')
#     stub_request(:get, "https://tastedive.com/api/similar?q=#{@movie}&k=#{ENV['TASTEDIVE_API_KEY']}&verbose=1&info").to_return(status: 200, body: json_response)
#   end
  
#   scenario 'can successfully flag a movie' do
#     visit dashboard_path
    
#     expect(Flag.count).to eq(0)
#     fill_in :search, with: @movie
#     click_button 'Search'
    
#     expect(current_path).to eq('/search')
    
#     within("#OiTiKOy59o4") do
#       click_button 'Flag'
#     end

#     expect(Flag.count).to eq(1)
#     expect(current_path).to eq(dashboard_path)
#   end
# end
