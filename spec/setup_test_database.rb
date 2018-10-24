require 'pg'

def setup_test_database
  "Setting up test database..."
  connection = PG.connect(dbname: 'diary_test')
  connection.exec("TRUNCATE diary_entries;")
end
