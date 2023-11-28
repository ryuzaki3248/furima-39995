# require 'rails_helper'

# RSpec.describe Item, type: :model do
#   before do
#     @item = FactoryBot.build(:item)
#   end

#   describe '商品出品機能' do
    
#     context '出品できる場合' do
#       it '全て入力されていれば出品できる' do
#         expect(@item).to be_valid
#       end
#     end

#     context '出品できない場合' do
#       it'商品画像がないと出品できない' do 
#         @item.image = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Image can't be blank")
#       end
    





#       it '商品名が空では出品できない' do
#         @item.product_name = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Product name can't be blank")
#       end
    
#       it '商品の説明がないと出品できない' do
#         @item.product_description = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Product description can't be blank")
#       end

#       # it 'カテゴリーの情報がないと出品できない' do
#       #   @item.category_id = nil
#       #   @item.valid?
#       #   expect(@item.errors.full_messages).to include("Category id can't be blank")
#       # end


#       it 'カテゴリーの情報がないと出品できない' do
#         @item.category = nil  # カテゴリーオブジェクト自体をnilに設定する
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Category can't be blank")
#       end


#       it '商品の状態の情報がないと出品できない' do
#         @item.product_condition = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Product condition can't be blank")
#       end

#       it '配送料の負担の情報がないと出品できない' do
#         @item.burden_of_shipping_charges = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Burden of shipping charges can't be blank")
#       end

#       it '発送元の地域の情報がないと出品できない' do
#         @item.prefecture = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Prefecture can't be blank")
#       end

#       it '発送までの日数の情報がないと出品できない' do
#         @item.number_of_days_until_shipping = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Number of days until shipping can't be blank")
#       end

#       it ' 価格の情報がないと出品できない' do
#         @item.selling_price = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Selling price can't be blank")
#       end

      


#     end
#   end
# end




require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全て入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明がないと出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'カテゴリーの情報がないと出品できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーが "---" の場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end      

      it '商品の状態の情報がないと出品できない' do
        @item.product_condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it '商品の状態が "---" の場合は出品できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end      

      it '配送料の負担の情報がないと出品できない' do
        @item.burden_of_shipping_charges = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of shipping charges can't be blank")
      end

      it '配送料の負担が "---" の場合は出品できない' do
        @item.burden_of_shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of shipping charges can't be blank")
      end      

      it '発送元の地域の情報がないと出品できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元の地域が "---" の場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end      

      it '発送までの日数の情報がないと出品できない' do
        @item.number_of_days_until_shipping = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of days until shipping can't be blank")
      end

      it '発送までの日数が "---" の場合は出品できない' do
        @item.number_of_days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of days until shipping can't be blank")
      end      

      it '価格の情報がないと出品できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      it '価格が300円未満では出品できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end

      it '価格が9,999,999円を超えると出品できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end

        it '価格が半角数字以外の場合は出品できない' do
          @item.selling_price = 'abc'
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price is not a number")
        end      
      
    end
  end
end

