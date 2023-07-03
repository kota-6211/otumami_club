class Users::SavedRecipesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.saved_recipes.new(recipe_id: @recipe.id)
    @favorite.save
  end
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.saved_recipes.find_by(recipe_id: @recipe.id)
    @favorite.destroy
  end
end
