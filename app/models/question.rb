class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates_presence_of :content

  def add_choices(choices)
    choices.each { |choice| self.choices.create(:content => choice) }
  end
end
