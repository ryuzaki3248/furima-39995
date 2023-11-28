class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
	belongs_to :product_condition
	belongs_to :burden_of_shipping_charges
	belongs_to :prefecture
	belongs_to :number_of_days_until_shipping

	belongs_to :user

	has_one_attached :image


	validates :image, presence: true
	validates :product_name, presence: true
	validates :product_description, presence: true
	validates :selling_price, presence: true,
	numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
	format: { with: /\A[0-9]+\z/, message: 'は半角数値のみ入力してください' }


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
	validates :burden_of_shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
	validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
	validates :number_of_days_until_shipping_id, numericality: { other_than: 1 , message: "can't be blank"} 
	
end



# class Item < ApplicationRecord
#   extend ActiveHash::Associations::ActiveRecordExtensions

#   belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
#   belongs_to :product_condition, class_name: 'ProductCondition', foreign_key: 'product_condition_id'
#   belongs_to :burden_of_shipping_charges, class_name: 'BurdenOfShippingCharges', foreign_key: 'burden_of_shipping_charges_id'
#   belongs_to :prefecture, class_name: 'Prefecture', foreign_key: 'prefecture_id'
#   belongs_to :number_of_days_until_shipping, class_name: 'NumberOfDaysUntilShipping', foreign_key: 'number_of_days_until_shipping_id'
#   end
