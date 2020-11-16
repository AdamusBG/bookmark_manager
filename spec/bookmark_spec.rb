require 'bookmark'

describe Bookmark do

  it "Returns an array when .all class method called" do
    expect(Bookmark.all).to eq(["http://www.myspace.com",
    "http://www.onemorelevel.com",
    "http://www.google.com"])
  end
end
