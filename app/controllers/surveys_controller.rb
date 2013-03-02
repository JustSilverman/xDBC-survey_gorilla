get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  puts "#{params[:questions]}"
  @survey = Survey.create :title      => params[:survey_title],
                          :creator_id => current_user.id
  create_questions_and_choices(@survey, params[:questions])
  redirect "/surveys/#{@survey.id}"
end

post '/surveys/submit' do
  @survey = Survey.find(params[:survey_id])
  @survey_responder = SurveyResponder.new(:survey_id => params[:survey_id],
                                          :responder_id => params[:responder_id])
  if @survey.completed?(params) && @survey_responder.save
    create_selections(params)
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
