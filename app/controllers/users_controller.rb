class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/new'
        else
            redirect '/devices'
        end
    end

    post '/signup' do

    end
end