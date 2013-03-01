class Selection < ActiveRecord::Base
  belongs_to :responder, :class_name => 'User'
  belongs_to :response, :class_name => 'Choice'
end
