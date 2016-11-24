require 'sinatra/base'
require_relative 'player'
require_relative 'game'
class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
      @player_1_name = $player_1.name
      @player_2_name = $player_2.name
      @player_1_points = $player_1.hit_points
      @player_2_points = $player_2.hit_points
    erb(:play)
  end

  get '/attack' do
    game = Game.new
    @player_2_name = $player_2.name
    game.attack($player_2)
    erb(:attack)
  end



run! if app_file == $0

end
