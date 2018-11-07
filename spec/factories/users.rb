FactoryBot.define do
  factory :user do
    provider { "google_oauth2" }
    uid { "12345678910" }
    email { "emmiehayes2@gmail.com" }
    first_name { "Emmie" }
    token { "abcdefg12345" }
    refresh_token { "12345abcdefg" }
    oauth_expires_at { DateTime.now }
  end
end