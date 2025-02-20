class CreateApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :applications,  id: false do |t|
      t.string :uuid, primary_key: true
      t.string :name
      t.string :token
      t.integer :chats_count, :default => 0

      t.timestamps
    end
    add_index :applications, :token, unique: true
  end
end
