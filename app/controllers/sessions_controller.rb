class SessionsController < ApplicationController

    get '/login' do 

        erb :'/users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty? 
        @error = "Username/Password cannot be empty, Please try again!"
            erb :'users/login'
        else 
            if user =User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect "/players"
            else
                @error = "Account not found"
                erb :'users/login'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end


end
