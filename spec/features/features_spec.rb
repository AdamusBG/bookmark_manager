require_relative "../../app"

feature BookmarkManager, type: :feature do
  scenario "returns a list of bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("www.google.com")
  end
end
