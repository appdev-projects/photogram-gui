# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
    # Renders index.html.erb by default
  end

  def show
    # Look up user by username since the test expects /users/[username]
    @user = User.find_by!(username: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Redirect to /users/[USERNAME] by explicitly building the URL using the username.
      redirect_to "/users/#{@user.username}"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.username}"
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to "/users"
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
