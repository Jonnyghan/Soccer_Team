class ClubsController < ApplicationController

  # GET: /clubs
  get "/clubs" do
    erb :"/clubs/index.html"
  end

  # GET: /clubs/new
  get "/clubs/new" do
    erb :"/clubs/new.html"
  end

  # POST: /clubs
  post "/clubs" do
    redirect "/clubs"
  end

  # GET: /clubs/5
  get "/clubs/:id" do
    erb :"/clubs/show.html"
  end

  # GET: /clubs/5/edit
  get "/clubs/:id/edit" do
    erb :"/clubs/edit.html"
  end

  # PATCH: /clubs/5
  patch "/clubs/:id" do
    redirect "/clubs/:id"
  end

  # DELETE: /clubs/5/delete
  delete "/clubs/:id/delete" do
    redirect "/clubs"
  end
end
