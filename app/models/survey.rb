class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => "User"
  has_many   :questions
  has_many   :survey_responders
  has_many   :responders, :through => :survey_responders, :source => :user

  validates_presence_of :title

  def process(params)
    # false if ###
    self.survey_responders.create(:responder_id => params[:responder_id])
    create_responses(params)
  end

  private
  def create_responses(params)
    params.keys.each do |response_id|
      Selection.create(:response_id  => response_id, 
                       :responder_id => params[:responder_id])
    end
  end
end
