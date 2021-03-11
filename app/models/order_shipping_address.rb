class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :postal, :city, :address, :phone_number, :country_id, :user_id, :build, :item_id
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address
    validates :city
    validates :phone_number, format: {with: /\A(0{1}\d{9,10})\z/, message: "is out of setting range"}
  end
  validates :country_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal: postal, address: address, city: city, phone_number: phone_number, build: build, country_id: country_id, order_id: order.id)
  end
end