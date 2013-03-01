enable :sessions

get '/home' do 
  #if current_user #!!!!N&J
    #erb :all_surveys_show
  #else 
    erb :loginsignup
  #end
end

get '/users/:user_id' do
  @user = User.find(:user_id)
  erb :user_show
end 

post '/signup' do
  @user = User.find_by_email(params[:email])
  if @user
    redirect('/home') #TODO: display errors
  else
    @user = User.create :name     => params[:name],
                        :email    => params[:email],
                        :password => params[:password] 
    @user.login #!!!!N&J 
    redirect('/albums')
  end
end 

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.authenticate #!!!!N&J 
    @user.login #!!!!N&J 
    redirect("/users/#{@user.id}")
  else 
    redirect '/home'
  end 
end 

get '/logout' do  #J: you said this should be DELETE, how?
  session.clear
  redirect '/albums'
end




