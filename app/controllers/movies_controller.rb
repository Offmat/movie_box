class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @director = Director.find_by(director_params) || Director.new(director_params)
    @movie = Movie.new(movie_params)
    binding.pry
    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
    if @director.persisted?

    else
      @director.save
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration, :info, :genres, :countries)
  end

  def director_params
    params.require(:director).permit(:name, :surname)
  end
end
