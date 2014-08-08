class Task < ActiveRecord::Base
  belongs_to :task_list
  has_many :users, :through => :task_users
  has_many :task_users, dependent: :destroy
  validates :task, presence: {message: "Your task could not be created"}

  def days_left
    due_date.mjd - Date.today.mjd
  end

  def each_user
    each_user = User.all
    user_arr = []
    each_user.each do |user|
      user_arr << [user.name,user.id]
    end
    user_arr
  end
end