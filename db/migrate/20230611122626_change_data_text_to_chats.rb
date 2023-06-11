class ChangeDataTextToChats < ActiveRecord::Migration[6.1]
  def change
    change_column :chats, :text, :text
  end
end
