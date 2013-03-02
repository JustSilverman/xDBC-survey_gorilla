enable :sessions

get '/' do
  redirect '/home'
end

get '/home' do 
  current_user ? erb(:all_surveys_show) : erb(:login_signup)
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_show
end 

post '/signup' do
  @user = User.new params
  if @user.save
    login(@user.id)
    redirect("/users/#{@user.id}")
  else 
    erb :login_signup
  end
end 

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    login(@user.id)
    redirect "/users/#{@user.id}"
  else 
    redirect '/home'
  end 
end 

delete '/logout' do  
  logout 
  redirect '/home'
end




