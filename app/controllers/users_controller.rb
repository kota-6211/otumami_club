class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def mypage
    @user = User.find_by(id: params[:user_id])
    if @user&.id != current_user.id
      redirect_to root_path
    end
  end

  def unsubscribe
  end
end
