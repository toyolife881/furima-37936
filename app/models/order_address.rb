class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :order_id, :token


 with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :municipality
  validates :house_number
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is too short or invalid"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :token
 end

 def save
   order = Order.create(user_id: user_id, item_id: item_id)
   Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
 end

end