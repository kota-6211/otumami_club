class Users::RecipesController < ApplicationController
  before_action :find_recipe, only: %w[ edit update destroy]

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

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

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

  def search
    @results = @q.result
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:alcohol_genre_id, :title, :body, :point, :cook_time, :recipe_image,
    ingredients_attributes: [:id, :name, :quantiry, :_destroy],
    steps_attributes: [:id, :step_number, :discription, :_destroy])
    .merge(user_id: current_user.id)
  end
end
