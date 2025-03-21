class CommentsController < ApplicationController
  def create
    # Build a new comment from form inputs
    new_comment = Comment.new
    new_comment.photo_id  = params[:comment_photo_id]
    new_comment.author_id = params[:comment_author_id]
    new_comment.body      = params[:comment_body]

    if new_comment.save
      # On success, redirect to the photo’s show page
      redirect_to "/photos/#{new_comment.photo_id}"
    else
      # If validations fail, redirect back or handle errors
      flash[:alert] = new_comment.errors.full_messages.to_sentence
      redirect_to "/photos/#{new_comment.photo_id}"
    end
  end
end
