class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :bound_id

      t.timestamps
    end
  end
end
