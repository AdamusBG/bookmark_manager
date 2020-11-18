require 'bookmark'

describe Bookmark do
  subject { Bookmark.new("title", "url") }

  it "Correctly returns its title" do
    expect(subject.title).to eq("title")
  end

  it "Correctly returns its url" do
    expect(subject.url).to eq("url")
  end

  it "Returns a list of bookmarks when .all is called" do
    #adding test data
    Bookmark.add('http://www.makersacademy.com', 'Makers')
    Bookmark.add('http://www.destroyallsoftware.com', 'Destroy all Software')
    Bookmark.add('http://www.google.com', 'Google')

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq(3)
    expect(bookmarks.first.title).to eq('Makers')
    expect(bookmarks.first.url).to eq('http://www.makersacademy.com')

    expect(bookmarks.first).to be_instance_of(Bookmark)
  end

  it "Adds a bookmark to the database when Bookmark.add is called" do
    Bookmark.add("www.reddit.com", "Reddit")
    bookmarks = Bookmark.all
    expect(bookmarks.length).to eq(1)
    expect(bookmarks.first.title).to eq("Reddit")
    expect(bookmarks.first.url).to eq("www.reddit.com")

    expect(bookmarks.first).to be_instance_of(Bookmark)
  end
end
