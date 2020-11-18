require 'pg'

class Bookmark

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    connection = PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark["url"]}
  end

end
