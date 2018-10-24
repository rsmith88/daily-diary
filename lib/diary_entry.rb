require 'pg'

class DiaryEntry
  def initialize(id:, title:, entry:, comments:)
    @title = title
    @entry = entry
    @comments = comments
  end

  attr_reader :title, :entry, :comments

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end
    result = connection.exec('SELECT * FROM diary_entries')
    result.map do |diary_entry|
      DiaryEntry.new(id: diary_entry["id"], title: diary_entry["title"], entry: diary_entry["entry"], comments: diary_entry["comments"])
    end
  end

  def self.create(title:, entry:, comments:)
  if ENV['ENVIRONMENT'] == 'test'
    connected = PG.connect(dbname: 'diary_test')
  else
    connected = PG.connect(dbname: 'diary')
  end
  connected.exec("INSERT INTO diary_entries (title, entry, comments) VALUES ('#{title}', '#{entry}', '#{comments}');")
  #Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0][url])
  end

end
