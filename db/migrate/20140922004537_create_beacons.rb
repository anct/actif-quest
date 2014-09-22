class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.integer :minor
      t.integer :major
      t.float :latitude
      t.float :longitude
      t.integer :floor
      t.integer :bound_id

      t.timestamps
    end
  end
end
