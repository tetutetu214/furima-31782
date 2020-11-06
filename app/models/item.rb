class Item < ApplicationRecord

 belongs_to :user
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :item_status
 belongs_to :fee_status
 belongs_to :prefecture
 belongs_to :scheduled_delivery
 has_one_attached :image

 
 validates :category_id, numericality: { other_than: 1 } 
 validates :item_status_id, numericality: { other_than: 1 } 
 validates :fee_status_id, numericality: { other_than: 1 } 
 validates :prefecture_id, numericality: { other_than: 1 } 
 validates :scheduled_delivery_id, numericality: { other_than: 1 } 
 
end
