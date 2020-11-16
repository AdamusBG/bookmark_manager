require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  enable :sessions # for session variables

  get '/' do
    erb(:hello_world)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
