class CreateSpamreports < ActiveRecord::Migration
  def change
    create_table :spamreports do |t|
      t.integer :reporter_id
      t.integer :spam_id
      t.string :spam_type

      t.timestamps
    end
  end
end
