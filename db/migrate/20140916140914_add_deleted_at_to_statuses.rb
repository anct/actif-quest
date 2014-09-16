class AddDeletedAtToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :deleted_at, :datetime
  end
end
