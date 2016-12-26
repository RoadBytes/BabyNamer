# class to handle BabyName
class BabyName < ActiveRecord::Base
  include VoteGemJay

  validates  :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user
  has_many   :comments, as: :commentable

  def user_handle
    if user
      user.handle
    else
      'Suggested by no one'
    end
  end
end
