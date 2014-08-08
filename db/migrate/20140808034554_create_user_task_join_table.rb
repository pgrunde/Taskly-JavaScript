class CreateUserTaskJoinTable < ActiveRecord::Migration
  def change
    create_table :task_users do |t|
      t.integer :user_id
      t.integer :task_id
    end
  end
end
