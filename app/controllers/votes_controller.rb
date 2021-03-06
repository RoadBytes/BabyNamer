# Voteable controller
class VotesController < ApplicationController
  before_action :require_user

  def create
    attributes    = vote_params.merge(user_id: current_user.id)
    voting_object = UserVote.new(input: attributes)

    flash[:notice]    = voting_object.message
    flash['tab_name'] = params['tab_name']

    redirect_to :back || baby_names_path
  end

  private

  def vote_params
    params.require(:vote).permit(:vote, :voteable_type, :voteable_id)
  end
end
