class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @opinion = Opinion.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    @movie.save ? redirect_to(@movie) : render('new')
  end

  def edit
  end

  def update
    authorize @movie
    @movie.update(movie_params) ? redirect_to(@movie) : render('edit')
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration, :info, :genres, :countries, director_ids: [], writer_ids: [])
  end
end
