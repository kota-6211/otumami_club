class HomesController < ApplicationController
  def top
    @genre = AlcoholGenre.all
    @beer = AlcoholGenre.find(4).recipes.order('id DESC').limit(4)
    @tags = Tag.all
    @q = Recipe.ransack(params[:q])
    @recipe2 = Recipe.find(2)
    @recipe3 = Recipe.find(3)
    @recipe4 = Recipe.find(4)
    @recipe5 = Recipe.find(5)
  end
end
