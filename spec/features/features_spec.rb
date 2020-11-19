require_relative "../../app"

feature BookmarkManager, type: :feature do

  scenario "Displays a list of bookmarks" do
    #adding test data
    Bookmark.add('http://www.makersacademy.com', 'Makers')
    Bookmark.add('http://www.destroyallsoftware.com', 'Destroy all Software')
    Bookmark.add('http://www.google.com', 'Google')

    visit('/')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy all Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end

  scenario "Can add a new bookmark and have it displayed" do
    add_a_bookmark
    expect(page).to have_link('Reddit', href: 'www.reddit.com')
  end

  scenario "Can delete a bookmark and have it not displayed" do
    add_a_bookmark
    click_button('delete')

    expect(page.status_code).to eq(200)
    expect(page).to_not have_link('Reddit', href: 'www.reddit.com')
  end
end
