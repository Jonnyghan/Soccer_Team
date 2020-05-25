require 'pry'
class ClubsController < ApplicationController
  
 
    # @players = Player.all
    # @notgk=Player.select {|p| p["position"] != "GK"}.sort_by{|p| p.position}
    # @forward = Player.select {|p| p["position"] == "Fwd"}
    # @midfield = Player.select {|p| p["position"] == "Mid"}
    # @defender = Player.select {|p| p["position"] == "Def"}
    # @goalie = Player.select {|p| p["position"] == "GK"}
  # GET: /players
  get "/clubs" do
    @clubs = Club.all.reverse
    erb :"/clubs/index.html"
  end
    
    
  # GET: /players/new
  get "/clubs/new" do
    @players = Player.all
    @notgk=Player.select {|p| p["position"] != "GK"}.sort_by{|p| p.position}
    @forward = Player.select {|p| p["position"] == "Fwd"}
    @midfield = Player.select {|p| p["position"] == "Mid"}
    @defender = Player.select {|p| p["position"] == "Def"}
    @goalie = Player.select {|p| p["position"] == "GK"}

      erb :"clubs/new.html"
    
  end

  # POST: /players
  post "/clubs" do
    params["club"][:user_id] = session[:user_id]
    club = Club.new(params["club"])
    club_players = params["players"].map{|a,b| b}.collect{|p| Player.find_by_id(p)}
    #binding.pry
    club.players << club_players 
    if club.save
      redirect "/clubs/#{club.id}"  
    else
      club.destroy
      @error= "Whoops, looks like you're missing something. Please try again!"
    
      redirect "/clubs/new"
    end
  end

  # GET: /players/5
  get "/clubs/:id" do
    
   if @club = Club.find_by_id(params[:id])
    #binding.pry 
    @user = User.find_by_id(@club.user_id)
    @fwd = @club.players.select{|p|p.position == "Fwd"}
    @mid = @club.players.select{|p|p.position == "Mid"}
    @def = @club.players.select{|p|p.position == "Def"}
    @gk = @club.players.select{|p|p.position == "GK"}
    erb :"/clubs/show.html"
   else
      redirect '/clubs'
   end
  end

  # GET: /players/5/edit
  get "/clubs/:id/edit" do
    @club = Club.find(params["id"])
    if @club.user_id == session[:user_id] 
    
    
    @user = User.find_by_id(@club.user_id)
    @fwd = @club.players.select{|p|p.position == "Fwd"}
    @mid = @club.players.select{|p|p.position == "Mid"}
    @def = @club.players.select{|p|p.position == "Def"}
    @gk = @club.players.select{|p|p.position == "GK"}

    @notgk=Player.select {|p| p["position"] != "GK"}
    @forward = Player.select {|p| p["position"] == "Fwd"}
    @midfield = Player.select {|p| p["position"] == "Mid"}
    @defender = Player.select {|p| p["position"] == "Def"}
    @goalie = Player.select {|p| p["position"] == "GK"}
    erb :"/clubs/edit.html"
    else
      redirect'/clubs'
    end
  end

  # PATCH: /players/5
  patch "/clubs/:id" do
    
   @club = Club.find(params["id"])
  
    

   
    if !params["club"]["name"].empty? && params["players"].length == 5
      @club.update(params["club"])
      club_players = params["players"].map{|a,b| b}.collect{|p| Player.find_by_id(p)}
      @club.players.clear
      @club.players << club_players 
      redirect "/clubs/#{@club.id}"  
    else
      
      @error= "Whoops, looks like you're missing something. Please try again!"
    
      redirect "clubs/#{@club.id}/edit"
   end
  end

  # DELETE: /players/5/delete
  delete "/clubs/:id" do
    club = Club.find(params[:id])
    if club.user_id == session[:user_id] 
      club.destroy
    end
    redirect "/clubs"
  end
    
end

     
    
