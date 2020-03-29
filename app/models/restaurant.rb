class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :approved, through: :favorites, source: :user
  
  has_many :likes
  has_many :followers, through: :likes, source: :user
end
