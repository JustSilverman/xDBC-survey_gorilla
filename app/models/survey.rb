class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => "User"
  has_many   :questions
  has_many   :survey_responders
  has_many   :responders, :through => :survey_responders, :source => :user

  validates_presence_of :title
end
