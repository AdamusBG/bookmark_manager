require_relative "../../app"

feature BookmarkManager, type: :feature do

  scenario "returns a list of bookmarks" do
    #adding test data
    Bookmark.add('http://www.makersacademy.com')
    Bookmark.add('http://www.destroyallsoftware.com')
    Bookmark.add('http://www.google.com')

    visit('/')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end


  scenario "returns a list of bookmarks" do
    visit('/add_bookmark')
    fill_in('url', with: 'www.reddit.com' )
    click_button('Save page')
    expect(page).to have_content('www.reddit.com')
  end
end
