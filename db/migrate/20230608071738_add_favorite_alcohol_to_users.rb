class AddFavoriteAlcoholToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :favorite_alcohol, :string
  end
end
