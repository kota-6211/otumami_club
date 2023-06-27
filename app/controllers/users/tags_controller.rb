class Users::TagsController < ApplicationController
  def index
    @tags = Tag.all
    @genre = AlcoholGenre.all
  end

  def show
    @tag = Tag.find(params[:id])
    @genre = AlcoholGenre.all
    @recipes = Recipe.all.includes(:user).order(created_at: :desc).page(params[:page])
  end
end
