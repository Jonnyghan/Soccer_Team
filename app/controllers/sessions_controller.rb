class SessionsController < ApplicationController

    get '/login' do 

        erb :'/users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty? 
        @error = "Username/Password cannot be empty, Please try again!"
            erb :'users/login'
        else
             
            if user=User.find_by(username: params["username"])
                
                if user.authenticate(params["password"])
                    
                    session[:user_id] = user.id
                    redirect "/clubs"
                else
                    @error = "Incorrect Password"
                    erb :'users/login'
                end
            else 
               
                @error = "Account not found, Please try again"
                erb :'users/login'     
            end
        end
    end

    get '/logout' do
        session.clear
        @goodbye = "You are now logged out. Goodbye!"
        erb :'welcome'
    end


end
