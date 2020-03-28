class ChangeDataRestIdToRestaurants < ActiveRecord::Migration[5.2]
  def change
     change_column :restaurants, :rest_id, :string
  end
end
