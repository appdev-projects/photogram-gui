# app/controllers/photos_controller.rb
class PhotosController < ApplicationController
  def index
    # Loads all Photos into @photos for display in index view
    @photos = Photo.all
  end

  def show
    # Loads one Photo for the show page
    @photo = Photo.find(params[:id])
    # Example: you can access custom methods in your view as well:
    #   @photo.poster
    #   @photo.comments
    #   @photo.likes
    #   @photo.fans
    #   @photo.fan_list
  end

  def new
    # Prepares a blank Photo for the new photo form
    @photo = Photo.new
  end

  def create
    # Instantiates a new Photo with permitted parameters
    # Make sure :owner_id, :caption, and :image line up with your form fields
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to("/photos/#{@photo.id}")  # or photo_path(@photo)
    else
      # If validations fail (e.g., poster is missing),
      # re-render the form so user can correct the data
      render("new")
    end
  end

  def edit
    # Loads the Photo to edit
    @photo = Photo.find(params[:id])
  end

  def update
    # Loads the existing Photo from the DB
    @photo = Photo.find(params[:id])

    # Updates attributes with permitted parameters
    if @photo.update(photo_params)
      redirect_to("/photos/#{@photo.id}")  # or photo_path(@photo)
    else
      render("edit")
    end
  end

  def destroy
    # Finds and deletes the specified Photo
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to("/photos")  # or photos_path
  end

  private

  # Strong parameters to help secure which attributes are allowed
  def photo_params
    # Make sure the keys here (e.g. :owner_id, :caption, :image)
    # match the form fields in your views.
    params.require(:photo).permit(:image, :caption, :owner_id)
  end
end
