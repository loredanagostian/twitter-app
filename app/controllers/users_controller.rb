class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show, :destroy ]
  before_action :admin_user, only: [ :destroy, :statistics, :update ]
  before_action :check_delete_user, only: [ :destroy ]

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first

    if @user.nil?
      redirect_to "/users"
    else
      @posts = @user.posts.paginate(page: params[:page], per_page: 5)
      @post = Post.new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user) 
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 2)
    render 'users/show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 2)
    render 'users/show_follow'
  end

  def statistics 
    if current_user.try(:admin?)
      @users = User.where(admin: false).paginate(page: params[:page], per_page: 2)
      @admins = User.where(admin: true).paginate(page: params[:page], per_page: 2)
      render 'statistics'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render 'user/edit', status: 422
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def make_admin
    user = User.find params[:id]
    user.update( :admin => true )
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :gender, :age, :phone_number, :avatar)
  end

  def check_delete_user
    user = User.where(params[:id])
    if user.name[0] != 'A' && user.name[0] != 'a'
      redirect_to users_path
    end
  end

end
