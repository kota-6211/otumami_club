class Users::TagsController < ApplicationController
  def index
    @tags = Tag.all
    @genre = AlcoholGenre.all
  end

  def show
    @tag = Tag.find(params[:id])
    @genre = AlcoholGenre.all
  end
end
