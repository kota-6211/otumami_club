class CreateVisionTags < ActiveRecord::Migration[6.1]
  def change
    create_table :vision_tags do |t|
      t.integer :recipe_id
      t.string :name

      t.timestamps
    end
  end
end
