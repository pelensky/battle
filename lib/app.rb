require 'sinatra/base'
require_relative "player.rb"
require_relative "game.rb"

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    if @game.lose?
      redirect to('/lose')
    else
    erb(:play)
  end
  end

  get '/attack' do
    @game = $game
    @game.attack
    erb(:attack)
  end

  get '/lose' do
    @game = $game
    erb(:lose)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
