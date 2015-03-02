class User < ActiveRecord::Base
  has_one :cart, foreign_key: :shopper_id
  has_many :cart_items, through: :cart, foreign_key: :shopper_id

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
