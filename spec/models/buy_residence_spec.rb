# require 'rails_helper'

# RSpec.describe BuyResidence, type: :model do
#   before do
#     @buy_residence = FactoryBot.build(:buy_residence)
#   end

#   describe '購入情報の保存' do
#     context '購入できる場合' do
#       it 'building_name以外が入力されていれば購入できる' do
#         expect(@buy_residence).to be_valid
#       end
#     end

#     context '購入できない場合' do
#       it '郵便番号が必須であること' do
#         @buy_residence.post_code = nil
#         @buy_residence.valid?
#         expect(@buy_residence.errors.full_messages).to include("Post code can't be blank")
#       end

#       it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
#         invalid_post_codes = ['1234567', '12-34567', '1234-567', '１２３-４５６７']
#         invalid_post_codes.each do |post_code|
#           @buy_residence.post_code = post_code
#           @buy_residence.valid?
#           expect(@buy_residence.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
#         end
#       end

#       it '都道府県が必須であること' do
#         @buy_residence.prefecture_id = nil
#         @buy_residence.valid?
#         expect(@buy_residence.errors.full_messages).to include("Prefecture can't be blank")
#       end

#       it '市区町村が必須であること' do
#         @buy_residence.municipalities = nil
#         @buy_residence.valid?
#         expect(@buy_residence.errors.full_messages).to include("Municipalities can't be blank")
#       end

#       it '番地が必須であること' do
#         @buy_residence.street_address = nil
#         @buy_residence.valid?
#         expect(@buy_residence.errors.full_messages).to include("Street address can't be blank")
#       end

#       it '建物名は任意であること' do
#         @buy_residence.building_name = nil
#         expect(@buy_residence).to be_valid
#       end

#       it '電話番号が必須であること' do
#         @buy_residence.telephone_number = nil
#         @buy_residence.valid?
#         expect(@buy_residence.errors.full_messages).to include("Telephone number can't be blank")
#       end

#       it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
#         invalid_telephone_numbers = ['090123456', '090-1234-5678', '０９０１２３４５６７８']
#         invalid_telephone_numbers.each do |telephone_number|
#           @buy_residence.telephone_number = telephone_number
#           @buy_residence.valid?
#           expect(@buy_residence.errors.full_messages).to include("Telephone number is invalid. Only allow 10 to 11 digits")
#         end
#       end
#     end
#   end
# end



require 'rails_helper'

RSpec.describe BuyResidence, type: :model do
  before do
    @buy_residence = FactoryBot.build(:buy_residence)
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
        @buy_residence.prefecture_id = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @buy_residence.municipalities = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が必須であること' do
        @buy_residence.street_address = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Street address can't be blank")
      end

      it '建物名は任意であること' do
        @buy_residence.building_name = nil
        expect(@buy_residence).to be_valid
      end

      it '電話番号が必須であること' do
        @buy_residence.telephone_number = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        invalid_telephone_numbers = ['090123456', '090-1234-5678', '０９０１２３４５６７８']
        invalid_telephone_numbers.each do |telephone_number|
          @buy_residence.telephone_number = telephone_number
          @buy_residence.valid?
          expect(@buy_residence.errors.full_messages).to include("Telephone number is invalid. Only allow 10 to 11 digits")
        end
      end
    end
  end
end