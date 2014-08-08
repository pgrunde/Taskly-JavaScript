User.destroy_all
TaskList.destroy_all

User.create!(
  name: "Some User",
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

User.create!(
  name: "Peter",
  email: 'peter.a.grunde@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

TaskList.create!(name: "Work List")
TaskList.create!(name: "Household Chores")
