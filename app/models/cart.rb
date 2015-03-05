class Cart < ActiveRecord::Base

  belongs_to :shopper, class_name: "User"
  has_many :cart_items
  has_many :products, through: :cart_items

  def purchased?
    self.purchased
  end

  def total
    total = 0
    self.cart_items.each do |cart_item|
      total += cart_item.product.price
    end
    total
  end

end
