get '/surveys/new' do 
  erb :create_survey
end

post '/surveys/new' do
  @survey = Survey.create :title      => params[:name],
                          :creator_id => current_user              
  redirect to "/surveys/#{@survey.id}"
end 

get '/surverys/:survey_id' do
  @survey = Survey.find(:survey_id)
  erb :survey_show
end 

get '/surverys/:survey_id/engage' do
  @survey = Survey.find(:survey_id)
  erb :survey_engage
end 
