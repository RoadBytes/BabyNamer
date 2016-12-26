# This models users/people of the app
class User < ActiveRecord::Base
  validates :email, presence: true
  has_many  :baby_names
  has_many  :comments
  has_many  :votes

  has_secure_password

  def handle
    name.blank? ? email : name
  end
end
