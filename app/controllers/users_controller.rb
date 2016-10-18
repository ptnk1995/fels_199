class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :update]
  before_action :load_user, only: [:show, :update, :correct_user]
  before_action :correct_user, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "new_user.success"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "update"
      redirect_to root_url
    else
      render :show
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "new_user.danger"
      redirect_to root_url
    end
  end
end
