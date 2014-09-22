class CreateBounds < ActiveRecord::Migration
  def change
    create_table :bounds do |t|
      t.string :name

      t.timestamps
    end
  end
end
