class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :thumbnail
  validate :thumbnail_presence
  
  def liked?(current_user)
    likes.where(user: current_user).exists?
  end
  private

  def thumbnail_presence
    errors.add(:thumbnail, 'must be attached') unless thumbnail.attached?
  end

  def show
    @comment = Comment.new
  end
end
