class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to 'users#new'
  end

  private
  def set_user
    if current_user
      @user ||= current_user
    else
      redirect_to new_user_path
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :phase)
  end
end
