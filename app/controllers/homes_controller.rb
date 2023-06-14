class HomesController < ApplicationController
  def top
    @genre = AlcoholGenre.all
    @beer = AlcoholGenre.find(1).recipes.order('id DESC').limit(2)
    @wine = AlcoholGenre.find(2).recipes.order('id DESC').limit(2)
    @tags = Tag.order(created_at: :desc).limit(25)
    @q = Recipe.ransack(params[:q])
    @recipe2 = Recipe.find(2)
    @recipe3 = Recipe.find(3)
    @recipe4 = Recipe.find(4)
    @recipe5 = Recipe.find(5)
    @recipe_favorites = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(4).pluck(:recipe_id))
  end
end
