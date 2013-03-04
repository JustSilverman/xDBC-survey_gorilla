class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many   :questions
  has_many   :survey_responders
  has_many   :responders, :through => :survey_responders, :source => :user

  validates_presence_of :title
  validate :validate_questions #KIKU is this custom validation?

  before_save { self.title.strip! } #KIKU this just takes out the custom white space?

  def add_questions(questions)
    questions.each do |question|
      new_question = self.questions.build(:content => question["content"]) #KIKU what is build
      new_question.add_choices(question["choices"])
    end
  end

  private
  def validate_questions
    errors[:base] << "Survey must have at least 1 question" if questions.empty? #KIKU what does questions refer to and why don't need to put Survey. in front of errors[:base]?
  end
end
