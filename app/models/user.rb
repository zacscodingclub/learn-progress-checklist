class User < ActiveRecord::Base
  belongs_to :role
  has_many :lectures
  has_many :notes, through: :lectures

  has_secure_password

  # id
  # email
  # username
  # password_digest
  # learn_name
  # lectures
  # notes
  # role
end