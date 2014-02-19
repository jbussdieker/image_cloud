# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "12345678#{Faker::Internet.password}" } # Ensure minimum length
  end
end
