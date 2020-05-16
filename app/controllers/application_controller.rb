require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret,  "7c554e078bd16af1669da55800461ca0b213d45f32122b1a29b0062f6e67ed3b35f889af3156765098290edd7a5f7b7f64728f8ba0c29b40cafc927743e8148a"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/login" do 
    erb :login
  end
end
