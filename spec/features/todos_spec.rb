require 'rails_helper'

feature 'Manage todos on the list', js: true do
  def create_todo(title)
    visit root_path
    fill_in "todo_title", with: title
    page.execute_script("$('form#new_todo').submit();")
  end

  scenario 'We can create new tasks' do
    title = "Catch a few Capybaras"
    create_todo(title)
    expect(page).to have_content(title)
  end

  scenario "The counter updates when creating new tasks" do
    title = "Catch a few Capybaras"
    create_todo(title)
    expect( page.find(:css, 'span#todo-count').text ).to eq "1"
  end

  scenario "The completed counter updates when completing tasks" do
    title = "Catch a few Capybaras"
    create_todo(title)
    expect( page.find(:css, 'span#completed-count').text ).to eq "0"
    check "todo-1"
    sleep 2

    expect( page.find(:css, 'span#todo-count').text ).to eq "0"
    expect( page.find(:css, 'span#completed-count').text ).to eq "1"
  end
end
