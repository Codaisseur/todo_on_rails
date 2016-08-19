require 'rails_helper'

feature 'Manage tasks', js: true do
  scenario 'add a new task' do
    # Point your browser towards the todo path
    visit todos_path

    # Enter description in the text field
    fill_in 'todo_title', with: 'Be Batman'

    # Press enter to submit the form
    page.execute_script("$('form').submit()")

    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('Be Batman')
  end

  scenario 'counter changes' do
    visit todos_path
    fill_in 'todo_title', with: 'Eat a cheese burger'
    page.execute_script("$('form').submit()")

    # Wait for 1 second so the counter can be updated
    sleep(1)

    expect(page.find(:css, 'span#todo-count').text).to eq "1"
  end
end
