class Item < ApplicationRecord
  belongs_to :user

  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :item_category_id, presence: true
  validates :item_status_id, presence: true
  validates :burden_of_charge_id, presence: true
  validates :delivery_prefecture_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, presence: true

end
