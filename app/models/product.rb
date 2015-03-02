class Product < ActiveRecord::Base
  has_many :cart_items
  belongs_to :category
end
