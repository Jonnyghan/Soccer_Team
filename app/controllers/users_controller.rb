class UsersController < ApplicationController

  # Sign up/ Create New User
  get "/signup" do
    erb :'/users/signup'
  end

  #DONT LET THEM CREATE ACCOUNTS WITH BLANK OR ExXISTING PARAMETERS
  post "/signup" do
    @user =User.new(params)
    if @user.username.empty? || @user.password.empty?
      @error = "Username/ Password cannot be empty, Please try again!"
      erb :'users/signup'
    elsif User.find_by(username: @user.username)
        @error= "Username taken, please choose a different one!"
        erb :'users/signup'
    else
      @user.save
      session[:user_id] = @user.id
      #binding.pry
      redirect "/players"
    end
  end

 
end
