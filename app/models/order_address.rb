class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :order_id, :token

  validates :user_id, presence: true
  validates :item_id, presence: true

  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  # order_idが生成されるのは、後述のsaveメソッドのとき
  # validates :order_id, presence: true

  validates :prefecture_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}

 def save
   order = Order.create(user_id: user_id, item_id: item_id)
   Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
 end

end