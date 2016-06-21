class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :learn_name, presence: true, uniqueness: true

  belongs_to :role
  has_many :lectures
  has_many :notes

  has_secure_password
end
