get '/surveys/new' do 
  erb :create_survey
end

get '/surverys/:survey_id' do
  @survey = Survey.find(:survey_id)
  erb :survey_show
end 

get '/surverys/:survey_id/engage' do
  @survey = Survey.find(:survey_id)
  erb :survey_engage
end 
