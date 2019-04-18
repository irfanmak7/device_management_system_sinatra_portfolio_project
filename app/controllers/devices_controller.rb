class DevicesController < ApplicationController

    get '/devices' do
        if logged_in?
            @devices = current_user.devices
            erb :'devices/index'
        else
            redirect to '/login'
        end
    end

    post '/devices' do
        if logged_in?
            if params[:name] == "" || params[:serial_number] == "" || params[:color] == ""
                redirect to "/devices/new"
            else
                @device = current_user.devices.build(name: params[:name], serial_number: params[:serial_number], color: params[:color])
                if @device.save
                    redirect to "/devices/#{@device.id}"
                else
                    redirect to "/devices/new"
                end
            end
        else
            redirect to '/login'
        end
    end

end