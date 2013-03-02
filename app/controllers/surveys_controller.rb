get '/surveys/new' do 
  erb :create_survey
end

post '/surveys' do
  @survey = Survey.create :title      => params[:survey_title],
                          :creator_id => current_user.id
  
  params[:questions].each do |question|
    @question = Question.create :content   => question.delete("content"),
                                :survey_id => @survey.id 
    create_choices(question)
  end
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

private
def create_choices(question)
  question.values.each do |choice|
    Choice.create :content => choice, :question_id => @question.id
  end
end
