class UsersController < ApplicationController
  def index
    #users = User.all
    # @ - variabila globala
    # fara @ - variabila locala
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first

    if @user.nil?
      redirect_to "/users"
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new( name: params['user']['name'],
                     email: params['user']['email'],
                     age: params['user']['age'],
                     gender: params['user']['gender'],
                     phone_number: params['user']['phone_number']
    )

    if user.save
      flash[:success] = 'User has been created successfully!'
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = 'Validation has failed!'
      redirect_to '/users/new'
    end
  end
end
