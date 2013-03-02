helpers do 
  def create_questions_and_choices
    params[:questions].each do |question|
    @question = Question.create :content   => question.delete("content"),
                                :survey_id => @survey.id 
    create_choices(question)
  end

  def create_choices(question)
    question.values.each do |choice|
      Choice.create :content => choice, :question_id => @question.id

  def create_selections(params)
    params.each do |key, id|
      unless key == :responder_id || :survey_id
        Selection.create(:response_id  => id, :responder_id => params[:responder_id])
      end
    end
  end
end
