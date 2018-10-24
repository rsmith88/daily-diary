require 'diary_entry.rb'

describe 'DiaryEntry' do
  describe '.all' do
    it 'lists all diary entries in the database' do
      connection = PG.connect(dbname: 'diary_test')
      connection.exec("INSERT INTO diary_entries (title, entry, comments) VALUES ('Tester', 'Test Entry', 'Test Comment');")
      connection.exec("INSERT INTO diary_entries (title, entry, comments) VALUES('Coffee', 'Coffee at 4', 'Coffee Shop');")

      diary_entries = DiaryEntry.all

      expect(diary_entries.length).to eq 2
      expect(diary_entries.first).to be_a DiaryEntry
      expect(diary_entries.first.title).to eq 'Tester'
      expect(diary_entries.first.entry).to eq 'Test Entry'
    end
  end
end
