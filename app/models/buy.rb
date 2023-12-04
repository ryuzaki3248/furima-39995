class Buy < ApplicationRecord
	belongs_to :user
	has_one :residence
end
