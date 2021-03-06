class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:previous_page] || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  def authenticate_user!

  end
end
