FactoryGirl.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Lorem.word }
    address { Faker::Lorem.word }
  end
end
