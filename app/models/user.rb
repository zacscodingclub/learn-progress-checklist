class User < ActiveRecord::Base
  validates_presence_of :email, :learn_name, :password_digest
  belongs_to :role
  has_many :lectures
  has_many :notes

  has_secure_password
end
