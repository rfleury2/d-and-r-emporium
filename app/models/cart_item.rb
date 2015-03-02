class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :shopper, through: :cart, class_name: "User"
end
