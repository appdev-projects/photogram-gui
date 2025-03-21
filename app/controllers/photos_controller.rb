# app/controllers/photos_controller.rb
class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @photo = Photo.new  # For the inline “Add Photo” form on index
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      # Redirect to the photo's show page (i.e., /photos/[PHOTO ID])
      redirect_to photo_path(@photo)
    else
      @photos = Photo.all
      render :index
    end
  end

  def update
    @photo = Photo.find(params[:id])
    # Preserve the existing owner_id if it's not provided in the update form
    update_params = photo_params
    update_params[:owner_id] ||= @photo.owner_id

    if @photo.update(update_params)
      redirect_to photo_path(@photo)
    else
      Rails.logger.info "Update failed: #{@photo.errors.full_messages.join(', ')}"
      render :show
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    # Permit :image, :caption, and :owner_id.
    params.require(:photo).permit(:image, :caption, :owner_id)
  end
end
