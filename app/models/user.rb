class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_confirmation_of :password, on: :create
  validates_presence_of :name, :email
  validates_presence_of :password_confirmation, on: :create
end
