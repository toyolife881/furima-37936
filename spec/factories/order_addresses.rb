FactoryBot.define do

  factory :order_address do

    token                  { Faker::Lorem.characters(number:32) }
    prefecture_id          { Faker::Number.within(range: 2..48) }
    phone_number           { Faker::Number.number(digits: 11) }

    Faker::Config.locale = :ja
    post_code              { Faker::Address.zip }
    municipality           { Faker::Address.city }
    house_number           { Faker::Address.street_address }
    building_name          { Faker::Address.building_number }


    association :user
    association :item

  end
  
end
