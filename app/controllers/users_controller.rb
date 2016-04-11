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
      redirect "/signup"
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

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/lectures"
    else
      redirect "/login"
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

    if logged_in?
      @user = User.find_by_learn_name(params[:slug])

      erb :'users/edit'
    else
      redirect "/login"
    end
  end

  patch '/users/:slug' do
    if params[:email].empty? || params[:learn_name].empty?
      redirect back
    elsif logged_in?
      @user = User.find_by_learn_name(params[:slug])
      binding.pry
      @user.update(email: params[:email],learn_name: params[:learn_name])

      erb :'users/show'
    else
      redirect "/login"
    end
  end
end
