# This models users/people of the app
class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password

  def handle
    name.blank? ? email : name
  end
end
