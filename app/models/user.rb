class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, class_name: 'RelationShip', foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_of_relationships, class_name: 'RelationShip', foreign_key: 'follow_id', dependent: :destroy

  has_many :followings, through: :relationships, source: :follow
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def follow(user_id)
    relationships.create(follow_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(follow_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
end