class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/
  validates :password_digest, presence: true
  has_secure_password #length is <=72 bytes, adds password_confirmation check (optional)
end
