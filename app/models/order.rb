class Order < ActiveRecord::Base
  belongs_to :cart
  after_create  :assign_total


  def assign_total
    # self.cart.total
  end

end
