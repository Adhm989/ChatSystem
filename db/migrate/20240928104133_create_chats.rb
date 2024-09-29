class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.string :application_id
      t.integer :messages_count

      t.timestamps
      t.index [:number], unique: true
    end
    add_foreign_key :chats, :applications, column: :application_id, primary_key: 'uuid'
  end
end
