class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def show
    @director = Director.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @director = Director.find_or_initialize_by(director_params)
    @writer = Writer.find_or_initialize_by(writer_params)
    @movie = Movie.new(movie_params)
    if @movie.valid? && @director.valid? && @writer.valid?
      @movie.save
      @director.save
      @writer.save
      MoviesDirector.new(movie: @movie, director: @director).save
      MoviesWriter.new(movie: @movie, writer: @writer).save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
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
    params.require(:movie).permit(:title, :release_date, :duration, :info, :genres, :countries)
  end

  def director_params
    params.require(:director).permit(:name, :surname)
  end

  def writer_params
    params.require(:writer).permit(:name, :surname)
  end
end
