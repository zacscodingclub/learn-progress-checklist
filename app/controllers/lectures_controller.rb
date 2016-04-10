class LecturesController < ApplicationController

  get '/lectures' do
    if logged_in?
      @lectures = Lecture.all

      erb :'lectures/index'
    else
      redirect "/login"
    end
  end

  get '/lectures/new' do
    if logged_in?
      erb :'lectures/new'
    else
      redirect "/login"
    end    
  end

  post '/lectures' do
    if params[:lecture][:title].empty? || params[:lecture][:url].empty?
      redirect "/lectures/new"
    elsif logged_in?
      @lecture = Lecture.create(title: params[:lecture][:title], url: params[:lecture][:url], user_id: current_user.id)
      
      unless params[:lecture][:tag_ids].empty?
        @lecture.tags << Tag.create(tag_name: params[:lecture][:tag_ids], lecture_id: @lecture.id)
      end

      unless params[:tag][:tag_name].empty?
        @lecture.tags << Tag.create(tag_name: params[:tag][:tag_name], lecture_id: @lecture.id)
      end

      redirect "/lectures/#{@lecture.slug}"
    else
      redirect "/login"
    end
  end

  get '/lectures/:slug' do
    if logged_in?
      @lecture = Lecture.find_by_slug(params[:slug])
      erb :'lectures/show'
    else
      redirect "/login"
    end

  end
end