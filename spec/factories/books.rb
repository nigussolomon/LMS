FactoryBot.define do
  factory :book do
    title { Faker::Lorem.word }
    author { Faker::Name.name }
    isbn { Faker::Lorem.word }
    publisher { Faker::Name.name }
    published_date { Faker::Date.forward(days: 2) }
    category { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    copy { 3 }
    status { "AVAILABLE" }
  end
end
