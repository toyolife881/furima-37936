FactoryBot.define do
  factory :item do
    item_name              { Faker::Commerce.product_name }
    item_explanation       { Faker::Lorem.sentence }
    item_category          { ItemCategory.all.sample }
    item_status            { ItemStatus.all.sample }
    burden_of_charge       { BurdenOfCharge.all.sample }
    delivery_prefecture    { DeliveryPrefecture.all.sample }
    delivery_days          { DeliveryDays.all.sample }
    price                  { Faker::Number.between(from: 300, to: 9999999) }

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
