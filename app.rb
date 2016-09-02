require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @hp1 = @game.player1.points
    @hp2 = @game.player2.points
    if @hp1 == 0 || @hp2 == 0
      redirect '/gameover'
    else
      @game.attack
      erb :attack
    end
  end

  get '/gameover' do
    erb :gameover
  end

  run! if app_file == $0
end
