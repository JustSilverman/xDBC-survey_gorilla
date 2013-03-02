class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many   :questions
  has_many   :survey_responders
  has_many   :responders, :through => :survey_responders, :source => :user

  validates_presence_of :title

  def add_questions(questions)
    questions.each do |question|
      new_question = self.questions.create(:content => question["content"])
      new_question.add_choices(question["choices"])
    end
  end

  def completed?(params)
    params.delete_if { |key, v| [:survey_id, :responder_id].include? key }
    if params.keys.map(&:to_i).sort == self.question_ids
      errors[:base] << "Survey is incomplete"
    end
  end
end
