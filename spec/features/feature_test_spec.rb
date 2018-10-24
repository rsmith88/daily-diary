feature 'Home page with welcome & diary entries' do
  scenario 'Welcomes user' do
    visit '/'
    expect(page).to have_content('Diary Application')
  end

  scenario 'Allows user to add diary entry' do
    visit '/'
    click_button 'Add'
    fill_in 'title', with: "Lunch Date"
    fill_in 'entry', with: "Meet friend for lunch"
    fill_in 'comments', with: "Don't be late!"
    click_button 'Save'
    expect(page).to have_content('Lunch Date')
  end
end
