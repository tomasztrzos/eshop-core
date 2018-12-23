class User < ApplicationRecord
  has_one :cart

  has_secure_password

  validates_length_of :password, minimum: 6, on: :create
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
end
