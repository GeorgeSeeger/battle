require 'sinatra/base'
require_relative 'player.rb'
require_relative 'game.rb'

class Battle < Sinatra::Base

  def self.game
    @game
  end

  def self.game= game
    @game = game
  end

  set :sessions, true
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:p1name])
    player2 = Player.new(params[:p2name])
    @game = Game.create(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @game = Game.instance
    @game.turn_switch
    if @game.player_attack.health > 0
      erb :play
    else
      redirect to ('/lose')
    end
  end

  get '/attack' do
    @game = Game.instance
    @game.attack
    erb :attack
  end

  get '/lose' do
    @game = Game.instance
    erb :lose
  end

  get '/paralyse' do
    @game = Game.instance
    @game.paralyse
    erb :attack
  end

  run! if app_file == $0
end
