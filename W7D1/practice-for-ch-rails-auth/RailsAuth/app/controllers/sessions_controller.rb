class SessionsController < ApplicationController
  before_action :require_logged_out, only: %i[new create]
  before_action :require_logged_in, only: :destroy

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destory
    logout!
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
