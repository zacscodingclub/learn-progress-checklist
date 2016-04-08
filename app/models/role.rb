class Role < ActiveRecord::Base
  has_many :users

  ROLES = {
      0 => "super_user",
     10 => "admin",
     20 => "user",
    100 => "public"
  }

end