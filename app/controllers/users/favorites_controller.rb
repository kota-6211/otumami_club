class Users::FavoritesController < ApplicationController
  
  def index
    @recipes = Recipe.joins(:favorites).group(:recipe_id).order('COUNT(favorites.id) DESC')
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.new(recipe_id: @recipe.id)
    @favorite.save
    redirect_to recipe_path(@recipe)
  end
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    @favorite.destroy
    redirect_to recipe_path(@recipe)
  end
end
