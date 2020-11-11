class Item < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true,
                                    greater_than: 299, less_than: 9_999_999 }
end
