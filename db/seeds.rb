require 'faker'

5.times do 
  User.create(:name  => Faker::Name.name,
              :email => "email@example#{rand(1..1000)}.com",
              :password => "password")
end
all_users = User.all

3.times do 
  survey = all_users.sample.created_surveys.create(:title => Faker::Lorem.sentence)
  5.times do 
    question = survey.questions.create(:content => Faker::Lorem.sentence)
    3.times do 
      question.choices.create(:content => Faker::Lorem.sentence)
    end
  end
end

Survey.all.each do |survey|
  responder = all_users.sample
  responder.survey_responders.create(:survey_id => survey.id)
  survey.questions.all.each do |question|
    Selection.create(:responder_id => responder.id,
                     :response_id  => question.choices.sample.id)
  end
end
