get '/surveys/new' do 
  erb :create_survey
end

post '/surveys' do
  p params 
  @survey = Survey.create params
  redirect "/surveys/#{@survey.id}"
end 

get '/surverys/:survey_id' do
  @survey = Survey.find(:survey_id)
  erb :survey_show
end 

get '/surverys/:survey_id/engage' do
  @survey = Survey.find(:survey_id)
  erb :survey_engage
end 
