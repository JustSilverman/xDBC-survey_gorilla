class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :selections, :foreign_key => 'response_id'
  has_many :responders, :through => :selections, :class_name => "User"

  validates_presence_of :content

  before_save { self.content.strip! }
end
