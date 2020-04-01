class AddReviewNameToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :review_name, :string
  end
end
