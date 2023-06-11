class HomesController < ApplicationController
  def top
    @genre = AlcoholGenre.all
    @beer = AlcoholGenre.find(4).recipes.order('id DESC').limit(4)
    @tags = Tag.all
    @q = Recipe.ransack(params[:q])
  end
end
