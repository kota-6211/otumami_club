class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :alcohol_genre, null: false, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false
      t.string :point
      t.string :cook_time

      t.timestamps
    end
  end
end
