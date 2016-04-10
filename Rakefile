ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do 
  zac = User.create(email: "email@example.com", learn_name: "zacscodingclub", password: "test")
  avi = User.create(email: "avi@example.com", learn_name: "aviflombaum", password: "test")

  l1 = Lecture.create(title: "Lecture One", url: "http://lectureone.com", user_id: zac.id)
  l2 = Lecture.create(title: "Lecture Two", url: "http://lecturetwo.com", user_id: avi.id)

  n1 = Note.create(content: "First note", user_id: avi.id, lecture_id: l1.id)
  n2 = Note.create(content: "Second note", user_id: zac.id, lecture_id: l1.id)

  t1 = Tag.create(tag_name: "ruby", lecture_id: l1.id)
  t2 = Tag.create(tag_name: "ruby", lecture_id: l2.id)
  
  Pry.start

  User.destroy_all
  Lecture.destroy_all
  Note.destroy_all
  Tag.destroy_all
end