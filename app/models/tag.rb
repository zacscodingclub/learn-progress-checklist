class Tags < ActiveRecord::Base
  has_many :lectures

  # OO Ruby
  # Rails
  # Job Placements
  # Etc.

  # tag_id, tag_text, lecture_id
end