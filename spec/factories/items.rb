FactoryBot.define do
  factory :item do
    name                  { 'はっぱ' }
    info                  { 'きれいなはっぱ' }
    category_id           { 2 }
    item_status_id        { 2 }
    fee_status_id         { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id { 2 }
    price                 { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
