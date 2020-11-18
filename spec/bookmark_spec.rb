require 'bookmark'

describe Bookmark do

  it "Returns a list of bookmarks when .all is called" do
    #adding test data
    Bookmark.add('http://www.makersacademy.com')
    Bookmark.add('http://www.destroyallsoftware.com')
    Bookmark.add('http://www.google.com')

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end

  it "Adds a bookmark to the database when Bookmark.add is called" do
    Bookmark.add("www.reddit.com")
    bookmarks = Bookmark.all
    expect(bookmarks).to include("www.reddit.com")
  end
end
