class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates_presence_of :content
  validate :validate_choices

  before_save { self.content.strip! } #KIKU just gets rid of whitespace?

  def total_responders
    Selection.where(:response_id => self.choice_ids).count #KIKU self.choice_ids returns? why does response_id equate to choice id?
  end

  def choice_percentage(choice_id)
    ((Choice.find(choice_id).selections.count / self.total_responders.to_f) * 100).round(1)
  end

  def sorted_choices
    # self.choices.sort_by { |choice| 1 / choice_percentage(choice.id) }
  end

  def add_choices(choices)
    choices.each { |choice| self.choices.build(:content => choice) } #KIKU
  end

  private
  def validate_choices
    errors[:base] << "Question must have at least 1 choice" if choices.empty?
  end
end
