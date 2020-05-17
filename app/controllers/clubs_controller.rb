require 'pry'
class ClubsController < ApplicationController
  
  # GET: /players
  get "/clubs" do
    #binding.pry
    if logged_in?
    @clubs = Club.all
    erb :"/clubs/index.html"
    else
      redirect '/login'
    end
  end

  # GET: /players/new
  get "/clubs/new" do
    require_login
      @players=Player.select {|p| p["position"] != "GK"}
      @fwd = Player.select {|p| p["position"] == "Fwd"}
      @mid = Player.select {|p| p["position"] == "Mid"}
      @def = Player.select {|p| p["position"] == "Def"}
      @gk = Player.select {|p| p["position"] == "GK"}
      erb :"clubs/new.html"
    
  end

  # POST: /players
  post "/clubs" do
    params["club"][:user_id] = session[:user_id]
    club = Club.create(params["club"])
    if club.save
      redirect "/clubs/#{club.id}"  
    else
      club.destroy
      @error= "Whoops, looks like you're missing something. Please try again!"
    #binding.pry
      redirect "/clubs/new"
    end
  end

  # GET: /players/5
  get "/clubs/:id" do
    
    @club = Club.find_by_id(params[:id])
    @any = Player.find_by_id(@club.any_id)
    @fwd = Player.find_by_id(@club.fwd_id)
    #binding.pry 
    @mid = Player.find_by_id(@club.mid_id)
    @def = Player.find_by_id(@club.def_id)
    @gk = Player.find_by_id(@club.gk_id)
    @user = User.find_by_id(@club.user_id)
    erb :"/clubs/show.html"
  end

  # GET: /players/5/edit
  get "/clubs/:id/edit" do
    @club = Club.find(params["id"])
    @any = Player.find_by_id(@club.any_id)
    #binding.pry
   @fwd = Player.find_by_id(@club.fwd_id)
   @mid = Player.find_by_id(@club.mid_id)
   @def = Player.find_by_id(@club.def_id)
   @gk = Player.find_by_id(@club.gk_id)
   @user = User.find_by_id(@club.user_id)
   @players=Player.select {|p| p["position"] != "GK"}
    @forward = Player.select {|p| p["position"] == "Fwd"}
    @midfield = Player.select {|p| p["position"] == "Mid"}
    @defender = Player.select {|p| p["position"] == "Def"}
    @goalie = Player.select {|p| p["position"] == "GK"}
    erb :"/clubs/edit.html"
  end

  # PATCH: /players/5
  patch "/clubs/:id" do
   #binding.pry 
   @club = Club.find(params["id"])
    

   
    if @club.update(params["club"])
      @club.update(params["club"])
      redirect "/clubs/#{@club.id}"  
    else
      
      @error= "Whoops, looks like you're missing something. Please try again!"
    #binding.pry
      erb :"clubs/edit.html"
   end
  end

  # DELETE: /players/5/delete
  delete "/clubs/:id" do
      club = Club.find(params[:id])
      club.destroy
    redirect "/"
  end
end
