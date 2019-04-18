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

    get '/devices/new' do
        if logged_in?
            erb :'devices/new'
        else
            redirect to '/login'
        end
    end

    get '/devices/:id' do
        if logged_in?
            @device = Device.find_by_id(params[:id])
            erb :'devices/show'
        else
            redirect to '/login'
        end
    end

    get '/devices/:id/edit' do
        if logged_in?
            @device = Device.find_by_id(params[:id])
            if @device && @device.user == current_user
              erb :'devices/edit'
            else
              redirect to '/devices'
            end
        else
            redirect to '/login'
        end
    end

    patch '/devices/:id' do
        if logged_in?
            if params[:name] == "" || params[:serial_number] == "" || params[:color] == ""
              redirect to "/devices/#{params[:id]}/edit"
            else
              @device = Device.find_by_id(params[:id])
              if @device && @device.user == current_user
                if @device.update(name: params[:name], serial_number: params[:serial_number], color: params[:color])
                  redirect to "/devices/#{@device.id}"
                else 
                  redirect to "/devices/#{@device.id}/edit"
                end
              else 
                redirect to '/devices'
              end
            end
        else 
            redirect to '/login'
        end
    end

    delete '/devices/:id/delete' do

    end

end