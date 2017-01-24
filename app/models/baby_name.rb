# class to handle BabyName
class BabyName < ActiveRecord::Base
  include VoteGemJay

  validates  :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user
  has_many   :comments, as: :commentable

  def self.all_names
    BabyName.all
  end

  def self.alphabetic
    all_names.order('lower(name) ASC')
  end

  def comment_count
    Comment.where(commentable: self).count
  end

  def self.latest
    all_names.order(created_at: :desc).limit(50)
  end

  def self.most_popular
    all_names.sort_by(&:vote_count).reverse.last(50)
  end

  def user_handle
    if user
      user.handle
    else
      'Suggested by no one'
    end
  end
end
