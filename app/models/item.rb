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
  numericality: {
		greater_than_or_equal_to: 300,
		less_than_or_equal_to: 9_999_999,
  only_integer: true
  }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
	validates :burden_of_shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
	validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
	validates :number_of_days_until_shipping_id, numericality: { other_than: 1 , message: "can't be blank"} 
	
end
