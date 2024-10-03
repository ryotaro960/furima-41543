class TradeRecordSendingAddress
  include ActiveModel::Model
  attr_accessor :furima, :user, :trade_record, :post_code, :prefecture_id, :sending_city, :sending_banchi, :sending_building, :sending_phone
  
  with_options presence: true do
    validates :furima
    validates :user
    validates :trade_record
    validates :post_code, numericality: {with: /\A\d{3}[-]\d{4}\z/}
    validates :sending_city
    validates :sending_banchi
    validates :sending_phone
  end
  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    trade_record = Trade_record.create(furima: furima, user: user)
    Address.create(trade_record: trade_record.id, post_code: post_code, prefecture_id: prefecture_id, sending_city: sending_city, sending_banchi: sending_banchi, sending_building: sending_building, sending_phone: sending_phone)
  end
end