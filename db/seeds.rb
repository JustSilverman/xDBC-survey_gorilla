require 'faker'

5.times do 
  User.create(:name  => Faker::Name.name,
              :email => "email@example#{rand(1..1000)}.com",
              :password => "password")
end
all_users = User.all

survey = Survey.create(:title => Faker::Lorem.sentence)

5.times do 
  question = survey.questions.create(:content => Faker::Lorem.sentence)
  3.times do 
    question.choices.create(:content => Faker::Lorem.sentence)
  end
end

Question.all.each do |question|
  Selection.create(:responder_id => all_users.sample.id,
                   :response_id  => question.choices.sample.id)
end
