class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :rest_id
      t.string :rest_name
      t.string :rest_place
      t.string :rest_phone
      t.text :rest_contents
      t.string :rest_image

      t.timestamps
    end
  end
end
