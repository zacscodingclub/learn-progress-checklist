class Lecture < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :date_created, presence: true

  belongs_to :user
  has_many :tags
  has_many :notes

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def embed_url
    self.url.gsub("watch?v=","embed/")
  end

  def datetime_created
    split = self.date_created.split(/[\/-]/)

    datetime_created = Date.strptime("{#{split[0]}, #{split[1]}, #{split[2]}}", "{%Y, %m, %d}")
  end

  def self.new_from_params(params)
    @lecture = Lecture.new(title: params[:lecture][:title],
                                url: params[:lecture][:url],
                       date_created: params[:lecture][:date_created],
                            user_id: params[:lecture][:user_id])
  end

  def tags_from_params(params)

    new_tags = params[:lecture][:tag_ids]
    prev_tags = self.tags.collect { |t| t.tag_name }

    new_tags.delete_if { |tag| prev_tags.include?(tag) }

    new_tags.each do |tag|
      Tag.create(tag_name: tag, lecture_id: self.id)
    end
  end

  def update_from_params(params)
    self.update(title: params[:lecture][:title],
                  url: params[:lecture][:url],
         date_created: params[:lecture][:date_created])
  end
end
