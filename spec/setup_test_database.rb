require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear test table
  connection.exec("TRUNCATE bookmarks;")
end