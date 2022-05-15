class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show, :destroy ]
  before_action :admin_user, only: [ :destroy ]

  def index
    #users = User.all
    # @ - variabila globala
    # fara @ - variabila locala

    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)

    if @user.nil?
      redirect_to "/users"
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def check_user
    if !logged_in?
      redirect_to login_path
    end
  end

  def admin_user
    redirect_to (root_url) unless current_user.admin?
  end

end
