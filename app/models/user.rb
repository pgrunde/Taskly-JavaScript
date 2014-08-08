class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks, :through => :task_users
  has_many :task_users, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}

end
