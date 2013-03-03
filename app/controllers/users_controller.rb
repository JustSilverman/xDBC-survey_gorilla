enable :sessions

get '/' do
  redirect '/home'
end

get '/home' do 
  @surveys = Survey.all
  current_user ? erb(:surveys_display) : erb(:login_signup)
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
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

get '/logout' do  
  logout 
  redirect '/home'
end




