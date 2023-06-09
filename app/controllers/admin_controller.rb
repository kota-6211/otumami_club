class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def top
    @genre = AlcoholGenre.all
  end

  private

  def authenticate_admin!
    redirect_to root_path unless current_user.admin
  end
end
