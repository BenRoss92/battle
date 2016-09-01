require 'sinatra/base'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    $game = Game.new($player1, $player2)
    redirect to('/play')
  end

  get '/play' do
    @player1_name = $player1.name
    @player2_name = $player2.name
    @attack = session[:attack]
    @player_2_hp = $player2.hp
    erb :play
  end

  get '/attack' do
    session[:attack] = true
    $game.attack($player2)
    redirect to('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
