class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nickname, :email, :encrypted_password, :full_width_last_name, 
          :full_width_first_name, :full_width_last_name_kana, 
          :full_width_first_name_kana, :birth_date, presence: true

validates :email, uniqueness: true

end