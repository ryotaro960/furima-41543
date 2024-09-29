require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end
  
  describe '商品出品' do
    context '商品出品できる場合' do
      it "item_name, explanation, category_id, status_id, payer_id, prefecture_id, waiting_id, price, imageが存在すれば登録できる" do
        expect(@furima).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "item_nameが空では登録できない" do
        @furima.item_name = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Item name can't be blank")
      end

      it "explanationが空では登録できない" do
        @furima.explanation = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが---では登録できない" do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが---では登録できない" do
        @furima.status_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Status can't be blank")
      end

      it "payer_idが---では登録できない" do
        @furima.payer_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Payer can't be blank")
      end

      it "prefecture_idが---では登録できない" do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "waiting_idが---では登録できない" do
        @furima.waiting_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Waiting can't be blank")
      end

      it "priceが空では登録できない" do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角では登録できない" do
        @furima.price = '１２３４５'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300未満では登録できない" do
        @furima.price = '280'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be in 300..9999999")
      end

      it "priceが10000000以上では登録できない" do
        @furima.price = '10000000'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be in 300..9999999")
      end

      it "imageが空では登録できない" do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end