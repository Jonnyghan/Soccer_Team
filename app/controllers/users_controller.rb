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
    else
      @user.save
      session[:user_id] = @user.id
      #binding.pry
      redirect "/players"
    end
  end

  # POST: /users
  get "/home/:id" do
    @user = User.find(params[:id])
    erb :'users/show.html'
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
