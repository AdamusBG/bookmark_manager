require 'bookmark'

describe Bookmark do

  it "Returns an array when .all class method called" do
    expect(Bookmark.all).to be_instance_of(Array)
  end
end
