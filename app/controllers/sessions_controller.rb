class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      log_in(user)
      redirect_to user_path(user)
    else
      flash.now[:error] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
