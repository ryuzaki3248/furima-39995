class Buy < ApplicationRecord
	belongs_to :user
	has_one :residence
	belongs_to :item
end
