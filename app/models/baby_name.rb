# class to handle BabyName
class BabyName < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user

  def user_handle
    if user
      user.handle
    else
      'Suggested by no one'
    end
  end
end
