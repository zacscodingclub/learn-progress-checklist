class Lecture < ActiveRecord::Base
  validates_presence_of :title, :url
  belongs_to :user
  has_many :tags
  has_many :notes

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def embed_url
    self.url.gsub("watch?v=","embed/")
  end
end