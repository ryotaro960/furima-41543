class Furima < ApplicationRecord

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :payer_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :waiting_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence: true, numericality: { in: 300..9999999 }
  validates :image, presence: true
  
  belongs_to :user
  # has_one :trade_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :waiting
end