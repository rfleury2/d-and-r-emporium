get '/orders' do
  @user = User.find_by(id: session[:user_id])
  @orders = Order.where(shopper_id: session[:user_id])
  erb :"orders/show"
end

post '/carts/:cart_id/orders' do
  @user = User.find_by(id: session[:user_id])
  @cart = Cart.find_by(id: params[:cart_id])
  order = Order.create(cart: @cart, total: @cart.total)
  order.shopper_id = @user.id
  if order.save
    @user.cart = Cart.create()
    redirect '/carts'
  else
    redirect '/'
  end
end
