class Tag < ActiveRecord::Base
  validates_presence_of :tag_name
  has_many :lectures

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
