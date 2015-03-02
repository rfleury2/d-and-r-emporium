#show
get '/categories/:category_id/products' do
  @category = Category.find(params[:category_id])
  @products = @category.products
  erb :"products/show"
end

get '/categories/:category_id/products/:product_id' do
  @category = Category.find(params[:category_id])
  @product = @category.products.find(params[:product_id])
  erb :"products/show"
end
