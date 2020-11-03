class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find{params[:id]}
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to ("/admin/genres")
    else
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update
      redirect_to admin_genre_path
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name,:is_valid)
  end
end
