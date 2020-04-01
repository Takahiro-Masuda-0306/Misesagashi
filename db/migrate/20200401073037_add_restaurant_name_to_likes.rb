class AddRestaurantNameToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :restaurant_name, :string
  end
end
