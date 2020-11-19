def add_a_bookmark
  visit('/bookmarks/new')
  fill_in('url', with: 'www.reddit.com' )
  fill_in('title', with: 'Reddit' )
  click_button('Save page')
end
