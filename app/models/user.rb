class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  validates :username, uniqueness: true

  enum role: [ :default, :admin ]
end
