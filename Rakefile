ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do 
  zac = User.create(email: "email@example.com", learn_name: "zacscodingclub", password: "test")
  avi = User.create(email: "avi@example.com", learn_name: "aviflombaum", password: "test")

  l1 = Lecture.create(title: "Lecture One", url: "http://lectureone.com", user_id: zac.id)
  l2 = Lecture.create(title: "Lecture Two", url: "http://lecturetwo.com", user_id: avi)

  

  Pry.start
end