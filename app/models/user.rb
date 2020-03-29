class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birth, presence: true
  has_secure_password
  
  has_many :favorites
  has_many :approvings, through: :favorites, source: :restaurant
  
  has_many :likes
  has_many :followings, through: :likes, source: :restaurant
  
  
  def approve(restaurant)
    self.favorites.find_or_create_by(restaurant_id: restaurant.id)
  end
  
  def unapprove(restaurant)
    approving = self.favorites.find_by(restaurant_id: restaurant.id)
    approving.destroy if approving
  end
  
  def approvings?(restaurant)
    self.approvings.include?(restaurant)
  end
  
  def follow(restaurant)
    self.likes.find_or_create_by(restaurant_id: restaurant.id)
  end
  
  def unfollow(restaurant)
    following = self.likes.find_by(restaurant_id: restaurant.id)
    following.destroy if following
  end
  
  def followings?(restaurant)
    self.followings.include?(restaurant)
  end

end
