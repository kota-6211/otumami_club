class Users::RecipesController < ApplicationController
  before_action :find_recipe, only: %w[ edit update destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @recipes = Recipe.all
    @tags = Tag.order(created_at: :desc).limit(25)
    @genre = AlcoholGenre.all
  end

  def new
    @recipe = Recipe.new
    @genre = AlcoholGenre.all
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
    @genre = AlcoholGenre.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if (current_user.admin != true) && (@recipe.user_id != current_user.id)
      redirect_to root_path
    end
    @genre = AlcoholGenre.all
  end

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
    redirect_to user_path(current_user)
  end

  def search
    @results = @q.result
    @genre = AlcoholGenre.all
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
