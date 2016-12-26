# Voteable controller
class VotesController < ApplicationController
  before_action :require_user

  def create
    attributes = vote_params.merge(user_id: current_user.id)
    vote = Vote.new(attributes)

    flash[:notice] = if vote.save
                       'Vote recorded'
                     else
                       vote.errors.full_messages.join(', ')
                     end

    redirect_to baby_names_path
  end

  private

  def vote_params
    params.require(:vote).permit(:vote, :voteable_type, :voteable_id)
  end
end
