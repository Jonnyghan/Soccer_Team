class UsersController < ApplicationController

  # Sign up/ Create New User
  get "/signup" do
    erb :'/users/signup'
  end

  #DONT LET THEM CREATE ACCOUNTS WITH BLANK OR ExXISTING PARAMETERS
  post "/signup" do
    @user =User.new(params)
    if @user.save
      @user.save
      session[:user_id] = @user.id
      
      redirect "/clubs"
   else
    
    @error = "Username/Password are either empty or that name is already taken!"
    erb :'users/signup'
    end
  end

 
end
