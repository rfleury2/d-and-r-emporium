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
    puts @user
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
    puts @user
    redirect '/'
  else
    @errors = "Your username or password was invalid"
    erb :"users/new"
  end
end

get '/users/new' do   ### Doesn't work yet
  erb :"users/new"
end

get '/users/logout' do   ### Doesn't work yet
  session.delete(:user_id)
  redirect '/'
end

