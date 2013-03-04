require 'digest/md5'

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :created_surveys,   :foreign_key => "creator_id", :class_name => "Survey"
  has_many :selections, :foreign_key => "responder_id"
  has_many :responses,  :through => :selections, :class_name => "Choice"
  has_many :survey_responders, :foreign_key => "responder_id"
  has_many :responded_surveys, :through => :survey_responders, :source => :survey #KIKU

  validates_presence_of :name, :email, :password

  validates :email, format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_create :encrypt_password

  def authenticate(attempt)
    self.id if self.password == Digest::MD5.hexdigest(attempt)
  end

  private
  def encrypt_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
