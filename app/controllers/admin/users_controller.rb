class Admin::UsersController < AdminController
  def index
    @users = User.all
    @genre = AlcoholGenre.all
  end

  def saved_recipes
    @user = User.find(params[:id])
    saved_recipes = SavedRecipe.where(user_id: current_user.id).pluck(:recipe_id)
    @saved_recipes = Recipe.find(saved_recipes)
  end

  def show
    @user = User.find_by(id: params[:id])
    @recipes = Recipe.all
    @genre = AlcoholGenre.all
  end

  def edit
    @user = User.find_by(id: params[:id])
    @genre = AlcoholGenre.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated user."
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def mypage
    @user = User.find(params[:id])
    @genre = AlcoholGenre.all
  end


  def search
    @results = @q.result
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :introduction, :favorite_alcohol, :profile_image)
    end

    def set_q
      @q = Recipe.ransack(params[:q])
    end
end
