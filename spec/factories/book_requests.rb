FactoryBot.define do
  factory :book_request do
    user { Faker::Name.name }
    isbn { Faker::Lorem.word }
    title { Faker::Lorem.word }
    publisher { Faker::Name.name }
    published_date { Faker::Date.forward(days: 0) }
    category { Faker::Lorem.word }
    status { "ACCEPTED" }
  end
end
