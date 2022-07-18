class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :birth_day, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }

  ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :last_name, presence: true, format: { with: ZENKAKU_REGEX }
  validates :first_name, presence: true, format: { with: ZENKAKU_REGEX }

  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX }
end
