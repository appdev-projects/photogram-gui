class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({:username => :asc})
  end

  def show
    @the_user = User.where({:username => params[:path_username]}).at(0)

    if @the_user == nil
      redirect_to("/404")
    end
  end
end
