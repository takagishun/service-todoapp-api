class User < ApplicationRecord
  has_many :posts
  validates :user_id, uniqueness: { case_sensitive: true }, presence: true
  validates :password_digest, presence: true
  has_secure_password
end
