class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genres = Genre.all
    @genre = Genre.find{params[:id]}
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to :index
    else
      render_to :index
    end
  end

  def update
    @genre.save
  end

  private
  def genre_params
    params.require(:genre).permit(:name,:is_valid)
  end
end
