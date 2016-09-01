require 'sinatra/base'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    $game = Game.new(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @player1_name = $game.get_name(:player_1)
    @player2_name = $game.get_name(:player_2)
    @attack = session[:attack]
    @player_1_hp = $game.get_hp(:player_1)
    @player_2_hp = $game.get_hp(:player_2)
    @current_turn = $game.current_turn
    @other_player = $game.other_player
    erb :play
  end

  get '/attack' do
    session[:attack] = true
    $game.attack
    redirect to('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
