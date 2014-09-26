class AddDeletedAtToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :deleted_at, :datetime
  end
end
