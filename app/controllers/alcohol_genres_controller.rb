class AlcoholGenresController < ApplicationController
  def index
    if current_user.admin != true
      redirect_to root_path
    end
    @alcohol_genres = AlcoholGenre.all
    @alcohol_genre = AlcoholGenre.new
  end

  def create
    @alcohol_genre = AlcoholGenre.new(alcohol_genre_params)
    if @alcohol_genre.save
      flash[:notice] = "ジャンル追加完了"
      redirect_to alcohol_genres_path
    else
      flash[:notice] = "ジャンル追加失敗"
      render index
    end
  end

  def show
  end

  def edit
    if current_user.admin != true
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def alcohol_genre_params
    params.require(:alcohol_genre).permit(:name)
  end
end
