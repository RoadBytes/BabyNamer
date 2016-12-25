# Voteable controller
class VotesController < ApplicationController
  def create
    attributes = vote_params.merge(user_id: 1)
    Vote.create(attributes)

    redirect_to baby_names_path
  end

  private

  def vote_params
    params.require(:vote).permit(:vote, :voteable_type, :voteable_id)
  end
end
