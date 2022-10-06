class CommentsController < ApplicationController
  before_action :check_user, only: [ :create ]

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post.id)
    else
      @error = @comment.errors.full_messages.to_s
      @error.delete! '[]'
      render post_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path
  end

  private
    def comments_params
      params.require(:comment).permit(:text, :post_id, :user_id)
    end
end
