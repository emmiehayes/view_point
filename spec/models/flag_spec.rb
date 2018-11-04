require 'rails_helper'

RSpec.describe Flag, type: :model do
  context 'relationships' do
    it { should belong_to(:user) } 
    it { should belong_to(:movie) } 
  end
end
