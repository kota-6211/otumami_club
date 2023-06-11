class RecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    drop_table :recipe_ingredients
  end
end
