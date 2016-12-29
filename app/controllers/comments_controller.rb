# Comment controller
class CommentsController < ApplicationController
  before_action :require_user

  def create
    attributes = comment_params.merge(user_id: current_user.id)
    @comment   = Comment.create(attributes)

    redirect_to @comment.commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_type,
                                    :commentable_id, :user_id)
  end
end
