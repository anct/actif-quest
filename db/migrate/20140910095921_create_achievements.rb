class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :condition
      t.string :description
      t.string :icon_url

      t.timestamps
    end
  end
end
