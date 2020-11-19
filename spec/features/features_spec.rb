require_relative "../../app"

feature BookmarkManager, type: :feature do

  scenario "returns a list of bookmarks" do
    #adding test data
    Bookmark.add('http://www.makersacademy.com', 'Makers')
    Bookmark.add('http://www.destroyallsoftware.com', 'Destroy all Software')
    Bookmark.add('http://www.google.com', 'Google')

    visit('/')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy all Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end


  scenario "returns a list of bookmarks" do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.reddit.com' )
    fill_in('title', with: 'Reddit' )
    click_button('Save page')
    expect(page).to have_link('Reddit', href: 'www.reddit.com')
  end
end
