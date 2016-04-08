require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  # commenting out these helpers made server work.
  #   - find out why?
  #        User table or associations not valid?
  #        redirect '/login'
  # 
  # helpers do
  #   def logged_in?
  #     !!session[:user_id]
  #   end

  #   def current_user
  #     User.find(session[:user_id])
  #   end

  #   def logout
  #     session.clear
  #     redirect '/login'
  #   end
  # end
end