class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/new'
        else
            redirect '/devices'
        end
    end

    post '/signup' do
        if params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.new(:name => params[:name], :email => params[:email],:password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect '/devices'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect '/devices'
        end
    end

    post '/login' do
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/devices'
        else
        redirect to '/signup'
        end
    end

    get '/logout' do

    end
end