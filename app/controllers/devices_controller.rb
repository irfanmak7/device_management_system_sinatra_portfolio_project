class DevicesController < ApplicationController

    get '/devices' do
        if logged_in?
            @devices = current_user.devices
            erb :'devices/index'
        else
            redirect to '/login'
        end
    end

end