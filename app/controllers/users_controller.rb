class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show, :destroy ]
  before_action :admin_user, only: [ :destroy ]
  before_action :check_delete_user, only: [ :destroy ]

  def index
    # @ - variabila globala
    # fara @ - variabila locala

    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first

    if @user.nil?
      redirect_to "/users"
      # Am pus mesaj in show.html.erb
    else
      @posts = @user.posts.paginate(page: params[:page], per_page: 5)
      @post = Post.new
    end
  end

  def new
    @user = User.new
  end

  def create
    # user = User.new( name: params['user']['name'],
    #                  email: params['user']['email'],
    #                  age: params['user']['age'],
    #                  gender: params['user']['gender'],
    #                  phone_number: params['user']['phone_number']
    # )

    @user = User.new(user_params)

    if @user.save
      # flash[:success] = 'User has been created successfully!'

      # redirect_to "/users/#{@user.id}"
      # SAU
      redirect_to user_path(@user)
    else
      # flash[:error] = 'Validation has failed!'
      render 'users/new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/users'
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def check_delete_user
    user = User.find(params[:id])
    if user.name[0] != 'A' && user.name[0] != 'a'
      redirect_to users_path
    end
  end

end
