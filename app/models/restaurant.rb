class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :approved, through: :favorites, source: :user
end
