class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string    :text, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
