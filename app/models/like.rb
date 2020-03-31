class Like < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  
  validates :review_title, presence: true, length: { maximum: 20 }
  validates :review_contents, length: { maximum: 150 }
  
end
