FactoryBot.define do
  factory :item do
    item_name                 { Faker::Commerce.product_name }
    item_explanation          { Faker::Lorem.sentence }
    item_category_id          { Faker::Number.within(range: 2..11) }
    item_status_id            { Faker::Number.within(range: 2..7) }
    burden_of_charge_id       { Faker::Number.within(range: 2..3) }
    delivery_prefecture_id    { Faker::Number.within(range: 2..48) }
    delivery_days_id          { Faker::Number.within(range: 2..4) }
    price                     { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
