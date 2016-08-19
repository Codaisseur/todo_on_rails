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
end
