require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should validate_presence_of(:title) }
  it { should_not validate_presence_of(:summary) }
  it { should_not validate_presence_of(:trailer_url) }
end