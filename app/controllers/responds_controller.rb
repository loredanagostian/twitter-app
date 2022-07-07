class RespondsController < ApplicationController
  before_action :check_user, only: [ :create ]

  def index
    @responds = Respond.all
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @respond = @comment.responds.new(respond_params)
    @respond.user_id = current_user.id
    @respond.post_id = @post.id
    @respond.comment_id = @comment.id

    if @respond.save
      redirect_to post_path(@post.id)
    else
      @error = @respond.errors.full_messages.to_s
      @error.delete! '[]'
      render post_path(@post.id)
    end
  end

  def destroy
    @respond = Respond.find(params[:id])
    @respond.destroy
    redirect_to post_path
  end

  private
  def respond_params
    params.require(:respond).permit(:content, :comment_id, :post_id, :user_id)
  end

end
