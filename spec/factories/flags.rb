FactoryBot.define do
  factory :flag, class: 'Flag' do
    user_id { 1 }
    movie_id { 1 }
  end
end
