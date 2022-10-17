class SecionsController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if @user
      session[:current_user_id]
      redirect_to
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
