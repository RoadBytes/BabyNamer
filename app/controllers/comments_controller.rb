# Comment controller
class CommentsController < ApplicationController
  before_action :require_user

  def create
    attributes = comment_params.merge(user_id: current_user.id)
    @comment   = Comment.create(attributes)

    if @comment.commentable_type =~ /^Page/
      redirect_to page_path('about')
    else
      redirect_to @comment.commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_type,
                                    :commentable_id)
  end
end
