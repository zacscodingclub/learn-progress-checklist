class LecturesController < ApplicationController

  get '/lectures' do
    if logged_in?
      @lectures = Lecture.all
      @sorted_lectures = @lectures.sort_by { |l| l.date_created }.reverse

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
    if logged_in?
      params[:lecture][:user_id] = current_user.id

      @lecture = Lecture.new_from_params(params)

      if @lecture.save

        unless params[:lecture][:tag_ids].nil?
          @lecture.tags_from_params(params)
        end

        unless params[:tag][:tag_name].empty?
          @lecture.tags << Tag.create(tag_name: params[:tag][:tag_name])
        end

        redirect "/lectures/#{@lecture.slug}"
      else
        @message = @lecture.errors.full_messages

        erb :'lectures/new'
      end
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

  get '/lectures/:slug/edit' do
    @lecture = Lecture.find_by_slug(params[:slug])

    if current_user.id == @lecture.user.id
      erb :'lectures/edit'
    else
      @message = "You do not have the permissions to see that page."

      redirect "/"
    end
  end

  patch '/lectures/:slug' do
    @lecture = Lecture.find_by_slug(params[:slug])

    if current_user.id == @lecture.user.id
      @lecture.update_from_params(params)

      unless params[:lecture][:tag_ids].nil?
        @lecture.tags_from_params(params)
      end

      unless params[:tag][:tag_name].empty?
        @lecture.tags << Tag.create(tag_name: params[:tag][:tag_name])
      end

      erb :'lectures/show'
    else
      @message = @lecture.errors.full_messages

      erb :'lectures/edit'
    end

  end
end
