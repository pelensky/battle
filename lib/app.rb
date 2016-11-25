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
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    Attack.run(@game.opponent_of(@game.turn))
    erb(:attack)
  end

  post '/switch-turns' do
    $game.switch_turn
    redirect '/play'
  end

run! if app_file == $0

end
