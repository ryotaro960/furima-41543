class TradeRecord < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one :sending_address
end