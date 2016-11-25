require 'sinatra/base'
require_relative 'player.rb'
require_relative 'game.rb'
require_relative "attack"


class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb(:play)
  end

  post '/attack' do
    @game = Game.instance
    Attack.run(@game.opponent_of(@game.turn))
    if (@game.opponent_of(@game.turn)).hit_points <= 0
      redirect '/lose'
    else
      redirect '/attack'
    end
  end

  get '/lose' do
    @game = Game.instance
    erb(:lose)
  end

  get '/attack' do
    @game = Game.instance
    erb(:attack)
  end


  post '/switch-turns' do
    @game = Game.instance.switch_turn
    redirect '/play'
  end

  run! if app_file == $0

end
