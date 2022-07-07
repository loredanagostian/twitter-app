class PostsController < ApplicationController
  before_action :check_user, only: [ :create ]

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = Post.new(params[:post])
  end

  def show
    @post = Post.where(id: params[:id]).first
    @comments = @post.comments

    if @post.nil?
      redirect_to "/posts"
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_path(current_user)
    else
      @user = current_user
      @posts = @user.posts.paginate(page: params[:page], per_page: 5)
      render 'users/show', status: 422
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      render 'posts/edit', status: 422
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end

end
