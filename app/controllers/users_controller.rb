class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/'
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    @user = User.new(email: params[:email], learn_name: params[:learn_name], password: params[:password])

    if @user.save
      session[:user_id] = @user.id

      redirect "/lectures"
    else
      @message = @user.errors.full_messages

      erb :'users/new'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/lectures"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.nil?
      @message = ["User not found. "]

      erb :"users/new"
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

       redirect "/lectures"
    else
      @message = ["Password incorrect."]

      erb :"users/login"
    end
  end

  get '/logout' do
    if logged_in?
      logout
    else
      redirect "/"
    end
  end

  get '/users' do
    if logged_in?
      @users = User.all

      erb :'users/index'
    else
      redirect "/login"
    end
  end

  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_learn_name(params[:slug])

      erb :'users/show'
    else
      redirect "/login"
    end
  end

  get '/users/:slug/edit' do
    @user = User.find_by_learn_name(params[:slug])

    if current_user.id == @user.id
      erb :'users/edit'
    else
      redirect "/"
    end
  end

  patch '/users/:slug' do
    @user = User.find_by_learn_name(params[:slug])

    if current_user.id == @user.id
      @user.email = params[:email]
      @user.learn_name = params[:learn_name]

      if @user.save
        user_path = "/users/#{@user.learn_name}"
        redirect user_path
      else
        @message = @user.errors.full_messages

        erb :'users/edit'
      end
    else
      redirect "/login"
    end
  end
end
