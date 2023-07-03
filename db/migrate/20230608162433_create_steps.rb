class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.string :step_number, null: false
      t.string :discription, null: false
      
      t.timestamps
    end
  end
end
