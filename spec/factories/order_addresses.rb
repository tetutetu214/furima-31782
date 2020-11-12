FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'さいたま市' }
    address { '1-1' }
    building { '柳ビル' }
    phone_number { '00000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
