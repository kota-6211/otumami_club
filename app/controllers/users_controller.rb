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
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if (current_user.admin != true) && (@user&.id != current_user.id)
      redirect_to root_path
    end
  end

  def update
  end

  def mypage
    @user = current_user
    @users = User.find_by(id: params[:user_id])
    if @users&.id != current_user.id
      redirect_to root_path
    end
  end

  def unsubscribe
  end
end
