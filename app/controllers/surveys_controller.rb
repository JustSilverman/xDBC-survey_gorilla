get '/surveys/new' do 
  erb :create_survey
end

post '/surveys' do
  @survey = Survey.create params
  redirect "/surveys/#{@survey.id}"
end

post '/surveys/submit' do
  # raise params.inspect
  @survey = Survey.find(params[:survey_id])
  if @survey.process(params)
    redirect "/surveys/#{@survey.id}"
  else
    erb :survey_engage
  end
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_show
end 

get '/surveys/:survey_id/engage' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_engage
end 
