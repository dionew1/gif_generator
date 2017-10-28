class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to favorites_path
    else
      flash[:failure] = "Incorrect Log In"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
