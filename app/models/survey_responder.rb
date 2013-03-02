class SurveyResponder < ActiveRecord::Base
  belongs_to :survey
  belongs_to :responder, :class_name => 'User'

  validates :survey_id, :uniqueness => { :scope => :responder_id }

end
