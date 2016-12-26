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

  def votes_for_today
    10 - votes.where("created_at::date = ?", Date.today).count
  end
end
