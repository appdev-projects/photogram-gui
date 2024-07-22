class PhotosController<ApplicationController
  def list
    @photos_list = Photo.all.order({:created_at=>:desc})
    render({ :template => "photo_templates/list" })
  end

  def show
    the_id=params.fetch("path_id")
    @the_photo=Photo.where(:id=>the_id).at(0)
    render({ :template => "photo_templates/show" })
  end

end
