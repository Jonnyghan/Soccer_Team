require 'pry'
class PlayersController < ApplicationController

  # GET: /players
  get "/players" do
    
    @players = Player.all
    @club = Club.all
    erb :"/players/index.html"
  end

  # GET: /players/new
  get "/players/new" do
    owner?
    erb :"/players/new.html"
  end

  # POST: /players
  post "/players" do
  
    player = Player.create(params)

    if !player.name.nil?  && !player.age.nil?  && !player.position.nil?
      player.save
      redirect "players/#{player.id}"
    else
      player.destroy
     @error = "Please try again!"
    erb  :"/players/new.html"
    end
  end

  # GET: /players/5
  get "/players/:id" do
    @player = Player.find(params[:id])
    erb :"/players/show.html"
  end

  # GET: /players/5/edit
  get "/players/:id/edit" do
   owner?
    @player = Player.find(params["id"])
    erb :"/players/edit.html"
  end

  # PATCH: /players/5
  patch "/players/:id" do
    
   @player = Player.find(params[:id])
   if !params["player"]["name"].empty? && !params["player"]["age"].empty? && !params["player"]["position"].empty?
      @player.update(params["player"])
      redirect "/players/#{params[:id]}"
   else 
    @error = "Looks Like You're Missing Something! Please Try Again."
    erb :"/players/edit.html"
   end
  end

  # DELETE: /players/5/delete
  delete "/players/:id" do
      player = Player.find(params[:id])
      player.destroy
    redirect "/players"
  end
end
