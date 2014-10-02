class CreateTakenTreasures < ActiveRecord::Migration
  def change
    create_table :taken_treasures do |t|
      t.string :user_id
      t.integer :treasure_id

      t.timestamps
    end
  end
end
