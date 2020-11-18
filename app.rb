require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions # for session variables

  get '/' do
    erb(:hello_world)
  end

  get '/bookmarks' do

    p ENV
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
