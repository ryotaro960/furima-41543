require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、password、password_confirmation、名前4か所、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
  
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    
      it 'emailは@を含まないと登録できない' do
        @user.email.slice!("@")
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'testword'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456789'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      it "苗字(全角)が空では登録できない" do
        @user.family_name_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name full can't be blank")
      end
    
      it "名前(全角)が空では登録できない" do
        @user.first_name_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full can't be blank")
      end
    
      it "苗字(全角)が全角でなければ登録できない" do
        @user.family_name_full = 'kadenokouji'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name full is invalid")
      end
    
      it "名前(全角)が全角でなければ登録できない" do
        @user.first_name_full = 'saneatsu'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full is invalid")
      end
    
      it "苗字(カナ)が空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
    
      it "名前(カナ)が空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
    
      it "苗字(カナ)が全角カタカナでなければ登録できない" do
        @user.family_name_kana = '勘解由小路'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
    
      it "名前(カナ)が全角カタカナでなければ登録できない" do
        @user.first_name_kana = '実篤'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "生年月日が空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
