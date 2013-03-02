helpers do
  def create_questions_and_choices(survey, questions)
    questions.each do |question|
      new_question = survey.questions.create(:content => question["content"])
      create_choices(new_question, question["choices"])
    end
  end

  def create_choices(question, choices)
    choices.each do |choice|
      question.choices.create(:content => choice)
    end
  end

  def create_selections(params)
    params.each do |key, id|
      unless [:responder_id, :survey_id].include? key
        Selection.create(:response_id  => id, :responder_id => params[:responder_id])
      end
    end
  end

end
