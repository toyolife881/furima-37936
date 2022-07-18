class Item < ApplicationRecord
  belongs_to :user

  validates :item_name, presence: true
  validates :item_explanation, presence: true

  HANKAKU_REGEX = /\A[0-9]+\z/.freeze
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: HANKAKU_REGEX }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :burden_of_charge
  belongs_to :delivery_prefecture
  belongs_to :delivery_days

  validates :item_category_id, presence: true
  validates :item_status_id, presence: true
  validates :burden_of_charge_id, presence: true
  validates :delivery_prefecture_id, presence: true
  validates :delivery_days_id, presence: true

  has_one_attached :image

  validates :image, presence: true
end
