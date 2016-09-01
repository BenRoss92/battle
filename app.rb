require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect to('/play')
  end

  get '/play' do
    @player1 = session[:player_1_name]
    @player2 = session[:player_2_name]
<<<<<<< HEAD
=======
    @attack = session[:attack]
>>>>>>> 3e64afd53b611b4add3f37f18d43794ac34255e6
    erb :play
  end

  get '/attack' do
    session[:attack] = true
    redirect to('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
