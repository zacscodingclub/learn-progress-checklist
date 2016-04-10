class NotesController < ApplicationController
  get '/notes' do
    @notes = Note.all

    erb :'notes/index'
  end

  post '/notes' do
    if params[:note][:content].empty?
      redirect back
    elsif logged_in?
      @note = Note.create(content: params[:note][:content], user_id: current_user.id, lecture_id: params[:note][:lecture_id])
      @lecture = Lecture.find(@note.lecture_id)

      redirect "/lectures/#{@lecture.slug}"
    else
      redirect "/login"
    end
  end

end