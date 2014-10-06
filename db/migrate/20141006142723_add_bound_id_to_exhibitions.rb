class AddBoundIdToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :bound_id, :integer
  end
end
