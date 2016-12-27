# handles User and Vote logic
class UserVote
  attr_reader :input, :message

  def initialize(options = {})
    @input = options[:input]
    @vote  = new_vote
  end

  def message
    if @vote.save
      'Vote recorded you have ' \
      "#{Vote.votes_left_for_today(input[:user_id])} " \
      'votes left'
    else
      @vote.errors.full_messages.join(', ')
    end
  end

  private

  def new_vote
    Vote.new(input)
  end
end
