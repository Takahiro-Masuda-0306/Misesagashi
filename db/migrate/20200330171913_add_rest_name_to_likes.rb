class AddRestNameToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :review_name, :string
    add_column :likes, :review_title, :string
    add_column :likes, :review_contents, :text
    add_column :likes, :review_image, :string
    add_column :likes, :review_rate, :float
  end
end
