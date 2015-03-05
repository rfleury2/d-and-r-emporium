get "/" do
  @user = User.find_by(id: session[:user_id])
  erb :index
end

get '/users/login' do
  erb :"users/login"
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Your username or password was incorrect"
    erb :"users/login"
  end
end

post '/users' do
  @user = User.create(params[:user])
  if @user
    session[:user_id] = @user.id
    @user.cart = Cart.create()
    if @user.save
      redirect '/'
    else
      @errors = "Could not create new cart"
      erb :"users/new"
    end
  else
    @errors = "Your username or password was invalid"
    erb :"users/new"
  end
end

get '/users/new' do
  erb :"users/new"
end

get '/users/logout' do
  session.delete(:user_id)
  redirect '/'
end
