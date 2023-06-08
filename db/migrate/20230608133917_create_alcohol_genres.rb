class CreateAlcoholGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :alcohol_genres do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
