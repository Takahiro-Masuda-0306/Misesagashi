class Like < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  
  validates :review_title, presence: true, length: { maximum: 20 }
  validates :score, presence: true
  validates :review_contents, length: { maximum: 300 }
  validates_uniqueness_of :restaurant_id, scope: :user_id
  
  mount_uploader :review_image, ImagesUploader
end
