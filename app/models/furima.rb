class Furima < ApplicationRecord

  validates :user, presence: true
  validates :item_name, presence: true
  validates :exolanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :waiting_id, presence: true
  validates :price, presence: true

  belongs_to :user
  # has_one :trade_record

end
