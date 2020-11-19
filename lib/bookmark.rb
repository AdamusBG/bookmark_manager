require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    connection = PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| Bookmark.new(bookmark["id"], bookmark["title"], bookmark["url"]) }
  end

  def self.add(url, title)
    connection = PG.connect(dbname: 'bookmark_manager')
    connection = PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

  def self.delete(id)
    connection = PG.connect(dbname: 'bookmark_manager')
    connection = PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end
