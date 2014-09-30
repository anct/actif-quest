class CreateSpamReports < ActiveRecord::Migration
  def change
    create_table :spam_reports do |t|
      t.integer :reporter_id
      t.integer :spam_id
      t.string :spam_type

      t.timestamps
    end
  end
end
