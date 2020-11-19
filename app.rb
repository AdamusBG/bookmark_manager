require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions # for session variables

  get '/' do
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  # the post version below is accessed when adding a new url then redirects to get version
  post '/bookmarks' do
    Bookmark.add(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb(:add_bookmark)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
