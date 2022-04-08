class UsersController < ApplicationController
  def index
    #users = User.all
    # @ - variabila globala
    # fara @ - variabila locala
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
  end
end
