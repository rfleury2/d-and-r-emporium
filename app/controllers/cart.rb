get '/carts' do
  @user = User.find_by(id: session[:user_id])
  # @products = CartItem.where(shopper: @user) # Must establish an @products
  erb :"carts/show"
end

post '/carts' do
  @user = User.find_by(id: session[:user_id])
  cart_item = @user.cart.cart_items.create
  cart_item.product_id = params[:product_id] ### Cart Item should have a .products.  Revisit the association
  cart_item.save
  if @user.save ### Do we need this?
    redirect '/carts'
  end
end
