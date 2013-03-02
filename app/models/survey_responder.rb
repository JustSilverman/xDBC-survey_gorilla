class SurveyResponder < ActiveRecord::Base
  belongs_to :survey
  belongs_to :responder, :class_name => 'User'

  validates :survey_id, :uniqueness => { :scope => :responder_id }

  def create_selections(response_ids)
     response_ids.each do |response_id|
       Selection.create(:response_id => response_id, :responder_id => self.id)
     end
  end
end
