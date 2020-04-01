class RemoveReviewNameFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :review_name, :string
  end
end
