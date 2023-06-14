class UsersController < ApplicationController
  def admin_top
    if current_user.admin != true
      redirect_to root_path
    end
  end

  def index
    if current_user.admin != true
      redirect_to root_path
    end
    @users = User.all
  end

  def saved_recipes
    # @user = User.find_by(id: params[:id])
    saved_recipes = SavedRecipe.where(user_id: current_user.id).pluck(:recipe_id)
    @saved_recipes = Recipe.find(saved_recipes)
  end

  def show
    @user = User.find_by(id: params[:id])
    @recipes = Recipe.all
  end

  def edit
    @user = User.find_by(id: params[:id])
    if (current_user.admin != true) && (@user&.id != current_user.id)
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated user."
    else
      render :edit
    end
  end

  def mypage
    @user = User.find_by(id: params[:user_id])
    if (current_user.admin != true) && (@user&.id != current_user.id)
      redirect_to root_path
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
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
