require 'sinatra/base'

class battle < Sinatra::Base
  get '/' do
    'Hello battle!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
