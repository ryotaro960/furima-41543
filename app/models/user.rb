class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/ }       
  validates :nickname, presence: true
  validates :family_name_full, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :first_name_full, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true

  has_many :items
  has_many :trade_records
end
