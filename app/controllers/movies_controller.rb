class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @director = Director.find_by(director_params) || Director.new(director_params)
    @writer = Writer.find_by(writer_params) || Writer.new(writer_params)
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end

    if @director.persisted?

    else
      @director.save
    end

    if @writer.persisted?

    else
      @writer.save
    end

  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end
  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration, :info, :genres, :countries)
  end

  def director_params
    params.require(:director).permit(:name, :surname)
  end

  def writer_params
    params.require(:writer).permit(:name, :surname)
  end
end
