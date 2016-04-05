class Role < ActiveRecord::Base
  has_many :users

  # 1. Basic User
  # 2. Admin
  # 3. SuperAdmin

  # plan_id, user_id
end