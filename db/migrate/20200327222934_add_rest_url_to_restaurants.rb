class AddRestUrlToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :rest_url, :string
  end
end
