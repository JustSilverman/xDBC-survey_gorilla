class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates_presence_of :content
  validate :validate_choices

  before_save { self.content.strip! }

  def add_choices(choices)
    choices.each { |choice| self.choices.build(:content => choice) }
  end

  private
  def validate_choices
    errors[:base] << "Question must have at least 1 choice" if choices.empty?
  end
end
