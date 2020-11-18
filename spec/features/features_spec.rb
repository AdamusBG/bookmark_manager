require_relative "../../app"

feature BookmarkManager, type: :feature do
  scenario "returns a list of bookmarks" do


    connection = PG.connect(dbname: 'bookmark_manager_test')

    #adding test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/bookmarks')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end
end
