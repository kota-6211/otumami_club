class HomesController < ApplicationController
  def top
    @genre = AlcoholGenre.all
    if AlcoholGenre.any?
      @beer = AlcoholGenre.find_by(name: "ビール").recipes.order('id DESC').limit(2)
      @wine = AlcoholGenre.find_by(name: "ワイン").recipes.order('id DESC').limit(2)
    end
    @tags = Tag.order(created_at: :desc).limit(25)
    @q = Recipe.ransack(params[:q])
    @pick_up_recipes = User.find_by(admin: true).recipes.limit(4)
    @recipe_favorites = Recipe.where(id: Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(4).pluck(:recipe_id))
    @genre = AlcoholGenre.all
  end
end
