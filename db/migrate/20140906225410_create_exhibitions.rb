class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.string :introduction
      t.string :image_url
      t.integer :group_id

      t.timestamps
    end
  end
end
