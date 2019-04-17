class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "device_management_system_app"
    end

    get '/' do
        erb :index
    end

    helpers do

        def logged_in?
            !!session[user_id]
        end

        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end

        def logout!

        end
    
    end
end