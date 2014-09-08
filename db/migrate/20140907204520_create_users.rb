class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :screen_name
      t.string :image_url

      t.timestamps

      t.index :name, unique: true
    end
  end
end
