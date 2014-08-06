require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do
  before :each do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
  end

  scenario 'User can view task lists' do
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario 'User see an about page' do
    visit signin_path
    click_on "about"
    expect(page).to have_content("Lorem ipsum")
  end

  scenario 'user can sign in and click an "+ Add Task List" link to see the add tasks form' do
    expect(page).to have_link("Add Task List")

    click_link "Add Task List"
    expect(page).to have_content("Add a task list")
  end

  scenario 'user can create a new task and see it appear on the signed-in root' do
    click_link "Add Task List"
    fill_in "task_list_name", with: "test task list"
    click_button "Create Task list"
    expect(page).to have_content "test task list"
    expect(page).to have_content "Task List was created successfully!"
  end

  scenario 'when a user enters a blank task they get the proper error message' do
    click_link "Add Task List"
    click_button "Create Task list"
    expect(page).to have_content "Your task list could not be created"
  end

  scenario 'Edit patches a task_list and cannot take blanks' do
    first('.task-list').click_link('Edit')
    expect(page).to have_content "Household Chores"
    fill_in "task_list_name", with: "sitting around"
    click_button "Update Task list"
    expect(page).to have_content "sitting around"
  end

end

feature 'tasks' do
  before :each do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
  end

  scenario 'user can add a task via "new task" link' do
    first('.task-list').click_link('+ Add Task')
    expect(page).to have_content "Due date"
    fill_in "Task", with: "any task"
    select "2014", from: "task_due_date_1i"
    select "August", from: "task_due_date_2i"
    select "22", from: "task_due_date_3i"
    click_button "Create Task"
    expect(page).to have_content "any task"
  end

  scenario 'user cannot leave date and task field blank' do
    first('.task-list').click_link('+ Add Task')
    click_button "Create Task"
    expect(page).to have_content "Your task could not be created"
  end

  scenario 'user can delete a task' do
    first('.task-list').click_link('+ Add Task')
    fill_in "Task", with: "any task"
    select "2014", from: "task_due_date_1i"
    select "August", from: "task_due_date_2i"
    select "22", from: "task_due_date_3i"
    click_button "Create Task"
    click_link "Delete"
    expect(page).to_not have_content "any task"
  end

  scenario 'user can click on a task list to view its tasks' do
    first('.task-list').click_link('+ Add Task')
    fill_in "Task", with: "any task"
    select "2014", from: "task_due_date_1i"
    select "August", from: "task_due_date_2i"
    select "22", from: "task_due_date_3i"
    click_button "Create Task"
    click_link "Household Chores"
    expect(page).to have_content "any task"
  end

  scenario 'user can click "Completed!" and the task will appear under the completed task list' do
    first('.task-list').click_link('+ Add Task')
    fill_in "Task", with: "any task"
    select "2014", from: "task_due_date_1i"
    select "August", from: "task_due_date_2i"
    select "22", from: "task_due_date_3i"
    click_button "Create Task"
    click_link "Household Chores"
    click_link "Completed!"
    expect(page).to_not have_content "any task"
  end

end