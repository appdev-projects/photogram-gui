# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  # Instead of validating the presence of the poster (which looks up a user by owner_id),
  # we validate that an owner_id is provided.
  validates :owner_id, presence: true

  def poster
    # Return the User record corresponding to owner_id (or nil if none exists)
    User.find_by(id: owner_id)
  end

  def comments
    Comment.where(photo_id: id)
  end

  def likes
    Like.where(photo_id: id)
  end

  def fans
    # Collect the fan_ids from likes and find the corresponding Users
    user_ids = likes.pluck(:fan_id)
    User.where(id: user_ids)
  end

  def fan_list
    # Build a sentence of usernames from the fans list
    fans.pluck(:username).to_sentence
  end
end
