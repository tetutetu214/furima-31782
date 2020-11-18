class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number
  end
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/	}
  validates :phone_number, format: { with: /\A\d{11}\z/	}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
