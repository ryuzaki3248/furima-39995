require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do

      it "nicknameとemail、passwordとpassword_confirmationとfull_width_last_nameとfull_width_first_nameとfull_width_last_name_kanaとfull_width_first_name_kanaとbirth_dateが存在すれば登録できる" do

        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
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
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end


      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは、半角英字だけでは登録できない' do
        @user.password = 'password' # これは半角英数字混合でない例
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = 'a23456'
        @user.password_confirmation = 'a234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは、半角数字だけでは登録できない' do
        @user.password = '111111' # これは半角英数字混合でない例
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end      

      it 'passwordは、全角では登録できない' do
        @user.password = 'あいうえお１１' # これは半角英数字混合でない例
        @user.password_confirmation = 'あいうえお１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end      

      it "full_width_last_nameが空では登録できない" do
        @user.full_width_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width last name can't be blank")
      end

      it "full_width_last_nameが全角（漢字・ひらがな・カタカナ）ではない場合は登録できない" do
        @user.full_width_last_name = 'ﾀﾛｳ' # 全角でない例を設定
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width last name must be full-width characters in hiragana, katakana, or kanji")
      end
  
      it "full_width_first_nameが空では登録できない" do
        @user.full_width_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width first name can't be blank")
      end

      it "full_width_first_nameが全角（漢字・ひらがな・カタカナ）ではない場合は登録できない" do
        @user.full_width_first_name = 'ﾀﾛｳ' # 全角でない例を設定
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width first name must be full-width characters in hiragana, katakana, or kanji")
      end

      it "full_width_last_name_kanaが空では登録できない" do
        @user.full_width_last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width last name kana can't be blank")
      end


      it "full_width_last_name_kanaが全角カタカナではない場合は登録できない" do
        @user.full_width_last_name_kana = 'ﾔﾏﾀﾞ' # 全角カタカナではない例
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width last name kana must be full-width katakana characters")
      end

      it "full_width_first_name_kanaが空では登録できない" do
        @user.full_width_first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width first name kana can't be blank")
      end

      it "full_width_first_name_kanaが全角カタカナではない場合は登録できない" do
        @user.full_width_first_name_kana = 'ﾀﾛｳ' # 全角カタカナではない例
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width first name kana must be full-width katakana characters")
      end

      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end
  end
end