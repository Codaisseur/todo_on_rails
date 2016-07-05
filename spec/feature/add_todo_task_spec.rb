require 'rails_helper'

def create_task(text)
  visit todos_path
  fill_in 'todo_title', with: text
  page.execute_script("$('form').submit()")
end



def create_tasks(tasks)
  visit todos_path
    tasks.each do |a|
      fill_in 'todo_title', with: a
    page.execute_script("$('form').submit()")
  end
end


feature 'Manage tasks', js: true do
  scenario 'We can add a new task' do
    create_task("Girls wanna have fun")
    expect(page).to have_content('Girls wanna have fun')
  end
end

feature 'Todo count change', js: true do
  scenario 'todo count change' do
    create_task("hello")
    expect( page.find(:css, 'span#total-count').text ).to eq "1"
  end
end

feature 'Manage tasks', js: true do
  scenario 'counts change on check box' do
    create_task("hai")
    check('todo-1')
    expect( page.find(:css, 'span#todo-count').text ).to eq "0"
  end
end

feature 'create 3 tasks', js: true do
  scenario 'create 3 task' do
    create_tasks ["Testo", "Testi", "Testor"]
    expect(page).to have_content('Testo')
    expect(page).to have_content('Testi')
    expect(page).to have_content('Testor')
    check('todo-1')
    check('todo-2')
    expect( page.find(:css, 'span#todo-count').text ).to eq "1"
    expect( page.find(:css, 'span#total-count').text ).to eq "3"
    expect( page.find(:css, 'span#completed-count').text ).to eq "2"
  end
end

# feature 'create 3 tasks and clean', js: true do
#   scenario 'create 3 task' do
#     create_3task("Hello", "test", "testo")
#     expect(page).to have_content('Hello')
#     expect(page).to have_content('test')
#     expect(page).to have_content('testo')
#     check('todo-1')
#     check('todo-2')
#     expect( page.find(:css, 'span#todo-count').text ).to eq "1"
#     expect( page.find(:css, 'span#total-count').text ).to eq "3"
#     expect( page.find(:css, 'span#completed-count').text ).to eq "2"
#     check('todo-3')
#     page.execute_script("$('#clean-up').click()")
#     expect( page.find(:css, 'span#total-count').text ).to eq "0"
#   end
# end
