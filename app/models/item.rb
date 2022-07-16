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



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :burden_of_charge
  belongs_to :delivery_prefecture
  belongs_to :delivery_days

  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" }  
  validates :burden_of_charge_id, numericality: { other_than: 1, message: "can't be blank" }  
  validates :delivery_prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_days_id, numericality: { other_than: 1, message: "can't be blank" } 
end
