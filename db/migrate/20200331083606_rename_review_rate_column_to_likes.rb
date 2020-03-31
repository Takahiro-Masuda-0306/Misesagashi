class RenameReviewRateColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :review_rate, :score
  end
end
