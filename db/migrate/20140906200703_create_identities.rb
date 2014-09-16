class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :uid
      t.string :provider
      t.string :token
      t.datetime :expires_at

      t.timestamps

      t.index :uid
      t.index [:uid, :provider], unique: true
      t.index [:user_id, :provider], unique: true
    end
  end
end
