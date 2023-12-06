require 'rails_helper'

RSpec.describe BuyResidence, type: :model do
  before do
    @user =FactoryBot.create(:user)
    @item =FactoryBot.create(:item, user_id: @user.id)
    @buy_residence = FactoryBot.build(:buy_residence, user_id: @user.id, item_id: @item.id)
    sleep 1
  end

  describe '購入情報の保存' do
    context '購入できる場合' do
      it 'building_name以外が入力されていれば購入できる' do
        expect(@buy_residence).to be_valid
      end
    end

    context '購入できない場合' do
      it 'トークンが必須であること' do
        @buy_residence.token = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が必須であること' do
        @buy_residence.post_code = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        invalid_post_codes = ['1234567', '12-34567', '1234-567', '１２３-４５６７']
        invalid_post_codes.each do |post_code|
          @buy_residence.post_code = post_code
          @buy_residence.valid?
          expect(@buy_residence.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
      end

      it '都道府県が必須であること' do
        @buy_residence.prefecture_id = 1
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が1以外であること' do
        @buy_residence.prefecture_id = 1
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @buy_residence.municipalities = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が必須であること' do
        @buy_residence.street_address = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が必須であること' do
        @buy_residence.telephone_number = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が10桁以上11桁以下であること' do
        @buy_residence.telephone_number = '123456789012'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Telephone number is invalid. Only allow 10 to 11 digits")
      end

      it '電話番号が10桁未満では購入できない' do
        @buy_residence.telephone_number = '123456789'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Telephone number is invalid. Only allow 10 to 11 digits")
      end

      it '電話番号が半角数値のみでなければ購入できない' do
        @buy_residence.telephone_number = '123456789A'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Telephone number is invalid. Only allow 10 to 11 digits")
      end

      it 'user_id（購入者）が空だと購入できない' do
        @buy_residence.user_id = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("User can't be blank")
      end
      
      it 'item_id（購入商品）が空だと購入できない' do
        @buy_residence.item_id = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Item can't be blank")


      end
    end
  end
end