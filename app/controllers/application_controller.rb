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

  helpers do
    def logged_in?
      if session[:user_id]
        !!current_user
      else
        false
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logout
      session.clear
      binding.pry
      redirect '/'
    end

    def breadcrumbs
      path = request.env["PATH_INFO"]

      if path.size < 2
        false
      else
        request.env["PATH_INFO"].split("/")[1]
      end
    end
  end
end
