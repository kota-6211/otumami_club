class ChangeCloumnsNotnullAddIngredients < ActiveRecord::Migration[6.1]
  def change
    change_column_null :ingredients, :quantiry, false
  end
end
