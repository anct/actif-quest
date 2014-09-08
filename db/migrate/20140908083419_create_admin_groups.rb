class CreateAdminGroups < ActiveRecord::Migration
  def change
    create_table :admin_groups do |t|

      t.timestamps
    end
  end
end
