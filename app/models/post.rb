class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail
  validate :thumbnail_presence
  private

  def thumbnail_presence
    errors.add(:thumbnail, 'must be attached') unless thumbnail.attached?
  end
end
