class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  has_one_attached :image

  # デバイスのバリデーション
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
  validates :full_width_last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "must be full-width characters in hiragana, katakana, or kanji" }
  validates :full_width_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "must be full-width characters in hiragana, katakana, or kanji" }
  validates :full_width_last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "must be full-width katakana characters" }
  validates :full_width_first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "must be full-width katakana characters" }
  validates :birth_date, presence: true

  has_many :items

  has_many :buys  

end