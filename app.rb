require 'sinatra/base'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.current_game
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    Game.new_game(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @attack = session[:attack]
    @player1 = {name: @game.get_name(:player_1), hp: @game.get_hp(:player_1)}
    @player2 = {name: @game.get_name(:player_2), hp: @game.get_hp(:player_2)}
    @current_turn, @other_player = @game.current_turn, @game.other_player
    erb :play
  end

  get '/attack' do
    session[:attack] = true
    @game.attack
    if @game.game_over
      redirect to('/game_over')
    else
      redirect to('/play')
    end
  end

  get '/game_over' do
    @other_player = @game.current_turn
    @current_turn = @game.other_player
    erb(:game_over)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
