class Admin::RecipesController < AdminController
  before_action :find_recipe, only: %w[ edit update destroy]

  def index
    @tags = Tag.order(created_at: :desc).limit(25)
    @genre = AlcoholGenre.all
    @recipes = Recipe.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @genre = AlcoholGenre.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genre = AlcoholGenre.all
  end

  def update
    if @recipe.update(recipe_params)
      @recipe.save_tags(params[:recipe][:tag])
      redirect_to admin_recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to admin_path
  end

  def search
    @results = @q.result
    @genre = AlcoholGenre.all
    @recipes = Recipe.all.includes(:user).order(created_at: :desc).page(params[:page])
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
