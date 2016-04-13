class Note < ActiveRecord::Base
  validates_presence_of :content
  
  belongs_to :lecture
  belongs_to :user

end
