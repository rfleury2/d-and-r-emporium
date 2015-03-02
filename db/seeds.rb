require 'faker'

10.times do
  Category.create(name: Faker::Commerce.department)
end
puts Category.all

50.times do
  name = Faker::Commerce.product_name
  price = Faker::Commerce.price
  product = Product.create({name: name, price: price})
  product.category = Category.all.sample
  product.save
end
