ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Rake::Task["seed"].invoke

  Pry.start

  Rake::Task["clean_db"].invoke
end

task :clean_db do
  User.destroy_all
  Lecture.destroy_all
  Note.destroy_all
  Tag.destroy_all
end

task :seed do
  ["ruby", "rack", "activerecord", "sinatra", "OO", "rails", "javascript","ajax", "html/css", "mvc", "enumerable", "miscellaneous"].each do |tag|
    Tag.create(tag_name: tag)
  end

  admin = User.create(email: "zbaston+admin@gmail.com", learn_name: "none-fwiw", password: "test")
  zac = User.create(email: "zbaston@gmail.com", learn_name: "zacscodingclub", password: "test")
  user = User.create(email: "user@example.com", learn_name: "user-one", password: "test")

  n1 = Note.create(content: "First note", user_id: user.id, lecture_id: l1.id)
  n2 = Note.create(content: "Second note", user_id: zac.id, lecture_id: l1.id)
end
