class Lecture < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :notes, through: :users


  # 1. LectureID
  # 2. title - string
  # 3. url - string
  # 4. Notes - text
  # 5. Status - bool
  # 6. user_id - int
  # 7. date - datetime
  # 8. tags - string
end