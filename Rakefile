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
  puts "Users: #{User.all.size}, Lectures: #{Lecture.all.size}, Notes: #{Note.all.size}, Tags: #{Tag.all.size}"
end

task :seed do
  ["ruby", "rack", "activerecord", "sinatra", "OO", "rails", "javascript","ajax", "html/css", "mvc", "enumerable", "miscellaneous"].each do |tag|
    Tag.create(tag_name: tag)
  end

  [
    ["zbaston+admin@gmail.com", "site-admin", "test"],
    ["zbaston@gmail.com","zacscodingclub","test"],
    ["user@example.com", "user-one", "test"]
  ].each do |user|
    User.create(email: user[0], learn_name: user[1], password: user[2])
  end

  [
    ["RailsConf 2015 - Opening Keynote","https://www.youtube.com/watch?v=KJVTM7mE1Cc", "2015-04-30",["rails", "DHH"]],
    ["Robert C. Martin - Clean Architecture", "https://www.youtube.com/watch?v=Nltqi7ODZTM", "2012-06-06",["uncle bob", "clean code"]],
    ["Bret Victor - The Future of Programming", "https://www.youtube.com/watch?v=8pTEmbeENF4", "2013-07-09",["miscellaneous"]]
  ].each do |lecture|
    l = Lecture.create(title: lecture[0], url: lecture[1], date_created: lecture[2], user_id: User.first.id)

  end

  n1 = Note.create(content: "First note", user_id: User.first.id, lecture_id: Lecture.first.id)
  n2 = Note.create(content: "Second note", user_id: User.all[1].id, lecture_id: Lecture.first.id)

  puts "Users: #{User.all.size}, Lectures: #{Lecture.all.size}, Notes: #{Note.all.size}, Tags: #{Tag.all.size}"
end
