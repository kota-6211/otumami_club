class Users::RecipesController < ApplicationController
  before_action :find_recipe, only: %w[show edit update destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe.save_tags(params[:recipe][:tag])
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      @recipe.save_tags(params[:recipe][:tag])
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:alcohol_genre_id, :title, :body, :point, :cook_time).merge(user_id: current_user.id)
  end
end
