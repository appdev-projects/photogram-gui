class UsersController<ApplicationController
  def list
    @user_list = User.all.order({:created_at=>:desc})
    render({ :template => "user_templates/list" })
  end
  def insert
    @new_user=User.new
    @new_user.username=params.fetch("username")
  #  if @new_user.valid?
      @new_user.save
    redirect_to("/users", { :notice => "Actor created successfully." })
 #   else
   #   redirect_to("/users")
  #  end
  end

  def edit
    the_username=params.fetch("path_id")
    @the_user=User.where({:username=>the_username}).at(0)
    @the_user.username=params.fetch("username")
    @the_user.save
    redirect_to("/users/#{@the_user.username}", { :notice => "Actor created successfully." })

  end

  def show
    the_id=params.fetch("path_id")
    @the_user=User.where(:username=>the_id).at(0)
    render({ :template => "user_templates/show" })
  end


end
