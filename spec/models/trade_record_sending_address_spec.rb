require 'rails_helper'

RSpec.describe TradeRecordSendingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    furima = FactoryBot.create(:furima)
    sleep(1)
    @order = FactoryBot.build(:trade_record_sending_address, user_id: user.id, furima_id: furima.id)
  end
  
  describe '購入手続き' do
    context '購入できる場合' do
      it "post_code, prefecture_id, sending_city, sending_banchi, sending_building, sending_phone, tokenが存在すれば購入できる" do
        expect(@order).to be_valid
      end

      it "sending_buildingが存在しなくても購入できる" do
        @order.sending_building
        expect(@order).to be_valid
      end
    end
  
    context '購入できない場合' do
      it "post_codeが空では購入できない" do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
    
      it "post_codeにハイフンがないと購入できない" do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "post_codeが6桁では購入できない" do
        @order.post_code = '123-456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが---では購入できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
    
      it "sending_cityが空では購入できない" do
        @order.sending_city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Sending city can't be blank")
      end
    
      it "sending_banchiが空では購入できない" do
        @order.sending_banchi = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Sending banchi can't be blank")
      end

      it "sending_phoneが空では購入できない" do
        @order.sending_phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Sending phone can't be blank")
      end

      it "sending_phoneが9文字以下では購入できない" do
        @order.sending_phone = 123456789
        @order.valid?
        expect(@order.errors.full_messages).to include("Sending phone is too short (minimum is 10 characters)")
      end

      it "sending_phoneが12文字以上では購入できない" do
        @order.sending_phone = 123456789012
        @order.valid?
        expect(@order.errors.full_messages).to include("Sending phone is too long (maximum is 11 characters)")
      end

      it "sending_phoneが半角数字以外では購入できない" do
        @order.sending_phone = '１２３４５６７８９０'
        @order.valid?
        expect(@order.errors.full_messages).to include("Sending phone is not a number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'furimaが紐付いていないと保存できないこと' do
        @order.furima_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Furima can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end