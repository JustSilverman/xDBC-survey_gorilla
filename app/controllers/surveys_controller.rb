get '/surveys/new' do
  erb :survey_create
end

post '/surveys' do
  @survey = Survey.create :title      => params[:survey_title],
                          :creator_id => current_user.id
  @survey.add_questions(params[:questions])

  redirect "/surveys/#{@survey.id}"
end

post '/surveys/submit' do
  @survey = Survey.find(params[:survey_id])
  @survey_responder = SurveyResponder.new(:survey_id => params[:survey_id],
                                          :responder_id => params[:responder_id])
  # Need to break if blank survey is submitted
  if @survey.completed?(params[:selections].first.keys) && @survey_responder.save
    @survey_responder.create_selections(params[:selections].first.values)
    redirect "/surveys/#{@survey.id}"
  else
    erb :survey_engage
  end
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_display
end

get '/surveys/:survey_id/engage' do
  @survey = Survey.find(params[:survey_id])
  @survey_responder = SurveyResponder.new(:survey_id => @survey.id,
                                          :responder_id => current_user.id)
  erb :survey_engage
end
