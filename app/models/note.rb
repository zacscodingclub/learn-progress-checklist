class Note < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :user

  # id
  # content
  # user_id
  # lecture_id
end