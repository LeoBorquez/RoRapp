class Micropost < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) } # Show the recent post first

  mount_uploader :picture, PictureUploader # mount_uploader method, takes as arguments a symbol representing the attribute and the class name of the generated uploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  validate :picture_size # "validate" for custom validation

  # Validates the size of an upload picture
  private def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Picture should be less than 5MB")
    end
  end

end
