class UsersController < ApplicationController
  before_action :require_logged_out, only: %i[new create]
  before_action :require_logged_in, only: %i[index edit update destroy]

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      # debugger
      login!(@user)
      # debugger
      redirect_to user_url(@user)
    else
      # debugger
      flash.now[:errors] = @user.errors.full_messages
      # debugger
      render :new
    end
  end

  def show
    # debugger
    @user = User.find(params[:id])
    render :show
  end

  def edit
    # debugger
    @user = User.find(params[:id])
    render :edit
  end

  def update
    # debugger
    @user = User.find(params[:id])
    if @user.update(user_params)
      # debugger
      redirect_to user_url(@user)
    else
      # debugger
      flash.now[:errors] = @user.errors.full_messages
      # debugger
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    # debugger
    params.require(:user).permit(:username, :password)
  end
end
