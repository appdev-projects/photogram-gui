# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
    # Renders index.html.erb by default
  end

  def show
    @user = User.find(params[:id])
    # Renders show.html.erb by default
  end

  def new
    # Prepare a blank User for the new user form
    @user = User.new
  end

  def create
    # Instantiate a new User from the strong params
    @user = User.new(user_params)

    if @user.save
      redirect_to("/users/#{@user.id}")  # or user_path(@user)
    else
      # If validations fail, re-render the new user form
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # Attempt to update with strong params
    if @user.update(user_params)
      redirect_to("/users/#{@user.id}")  # or user_path(@user)
    else
      # If validations fail, re-render the edit user form
      render("edit")
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to("/users")  # or users_path
  end

  private

  # Strong parameters to control which attributes are allowed during mass assignment
  def user_params
    # You can add more permitted attributes here (e.g., :private) if needed
    params.require(:user).permit(:username)
  end
end
