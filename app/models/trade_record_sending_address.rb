class TradeRecordSendingAddress
  include ActiveModel::Model
  attr_accessor :furima_id, :user_id, :trade_record, :post_code, :prefecture_id, :sending_city, :sending_banchi, :sending_building, :sending_phone, :token
  
  with_options presence: true do
    validates :furima_id
    validates :user_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :sending_city
    validates :sending_banchi
    validates :sending_phone, numericality: {only_integer: true}, length: { in: 10..11 }
    validates :token
  end
  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    trade_record = TradeRecord.create(furima_id: furima_id, user_id: user_id)
    SendingAddress.create(trade_record_id: trade_record.id, post_code: post_code, prefecture_id: prefecture_id, sending_city: sending_city, sending_banchi: sending_banchi, sending_building: sending_building, sending_phone: sending_phone)
  end
end