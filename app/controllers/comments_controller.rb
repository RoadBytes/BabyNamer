# Comment controller
class CommentsController < ApplicationController
  before_action :require_user

  def create
    attributes = comment_params.merge(user_id: current_user.id)
    Comment.create(attributes)

    redirect_to baby_name_path(attributes[:commentable_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_type,
                                    :commentable_id, :user_id)
  end
end
