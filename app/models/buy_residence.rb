# class BuyResidence
# 		include ActiveModel::Model
# 		attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user_id, :item_id
	
# 		with_options presence: true do	
# 			 # 数字3桁、ハイフン、数字4桁の並びのみ許可する
# 		  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}	
# 	end
# 	validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

# def save
# 	buy = Buy.create(user_id: user_id, item_id: item_id)
# 	Residence.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
#   end
# end


class BuyResidence
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities, presence: true
    validates :street_address, presence: true
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: "is invalid. Only allow 10 to 11 digits" }
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Residence.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end