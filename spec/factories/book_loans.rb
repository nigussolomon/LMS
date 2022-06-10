FactoryBot.define do
  factory :book_loan do
    association :book
    user { Faker::Name.name }
    loan_date { Faker::Date.forward(days: 0) }
    return_date { Faker::Date.forward(days: 15) }
    status { "RETURNED" }
  end
end
