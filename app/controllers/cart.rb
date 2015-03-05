get '/carts' do
  @user = User.find_by(id: session[:user_id])
  @cart_items = @user.cart.cart_items
  erb :"carts/show"
end

post '/carts' do
  @user = User.find_by(id: session[:user_id])
  if @user
    cart_item = @user.cart.cart_items.create(product: Product.find_by(id: params[:product_id]))
    redirect '/carts'
  else
    redirect '/users/login'
  end
end

delete '/carts/:id' do
  @user = User.find_by(id: session[:user_id])
  CartItem.find_by(id: params[:id]).destroy
  redirect '/carts'
end
