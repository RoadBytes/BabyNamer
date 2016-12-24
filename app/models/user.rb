# This models users/people of the app
class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password
end
