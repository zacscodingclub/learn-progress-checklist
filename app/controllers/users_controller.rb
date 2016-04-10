class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
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
    @users = User.all

    erb :'users/index'
  end

  get '/users/:slug' do 
    @user = User.find_by_learn_name(params[:slug])

    erb :'users/show'
  end
end