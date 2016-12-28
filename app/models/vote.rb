# Persistence of votes
class Vote < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :voteable, polymorphic: true
  validate   :votes_limited_to_10_per_day

  def votes_limited_to_10_per_day
    errors.add(:base, 'Only 10 votes per day') unless Vote
                                                      .vote_available?(user_id)
  end

  def self.vote_count_today(user_id)
    where(user_id: user_id)
      .where('created_at::date = ?', Time.now.utc.to_date)
      .count
  end

  def self.votes_left_for_today(user_id)
    10 - vote_count_today(user_id)
  end

  def self.vote_available?(user_id)
    vote_count_today(user_id) < 10
  end
end
