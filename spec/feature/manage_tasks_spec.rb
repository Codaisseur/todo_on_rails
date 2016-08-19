require 'rails_helper'

feature 'Manage tasks', js: true do
  scenario 'add a new task' do
    visit todos_path
    fill_in 'todo_title', with: 'Be Batman'
    page.execute_script("$('form').submit()")

    expect(page).to have_content('Be Batman')
  end

  scenario 'counter changes' do
    visit todos_path
    fill_in 'todo_title', with: 'Eat a cheese burger'
    page.execute_script("$('form').submit()")

    sleep(1)

    expect(page.find(:css, 'span#todo-count').text).to eq "1"
  end

  scenario 'complete a task' do
    visit todos_path
    fill_in 'todo_title', with: 'go to candy mountain'
    page.execute_script("$('form').submit()")

    check('todo-1')

    sleep(1)

    expect(page.find(:css, 'span#todo-count').text).to eq "0"
  end
end
