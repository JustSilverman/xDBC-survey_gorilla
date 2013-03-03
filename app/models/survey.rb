class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many   :questions
  has_many   :survey_responders
  has_many   :responders, :through => :survey_responders, :source => :user

  validates_presence_of :title
  validate :validate_questions

  before_save { self.title.strip! }

  def add_questions(questions)
    questions.each do |question|
      new_question = self.questions.build(:content => question["content"])
      new_question.add_choices(question["choices"])
    end
  end

  private
  def validate_questions
    errors[:base] << "Survey must have at least 1 question" if questions.empty?
  end
end
