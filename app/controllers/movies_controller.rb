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
    @director = Director.new
    @writer = Writer.new
  end

  def create
    @movie = Movie.new(movie_params)
    check_directors
    check_writers
    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    check_directors
    check_writers
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
  
  def check_directors
    @movie.directors.each do |director|
      MoviesDirector.find_by(movie: @movie, director: director).delete if !director_ids.include?(director.id)
    end

    director_ids.each do |id|
      MoviesDirector.new(movie: @movie, director_id: id).save
    end
  end


  def check_writers
    @movie.writers.each do |writer|
      MoviesWriter.find_by(movie: @movie, writer: writer).delete if !writer_ids.include?(writer.id)
    end

    writer_ids.each do |id|
      MoviesWriter.new(movie: @movie, writer_id: id).save
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration, :info, :genres, :countries)
  end

  def director_ids
    params.require(:movie).permit(director_ids: [])[:director_ids].map(&:to_i)
  end

  def writer_ids
    params.require(:movie).permit(writer_ids: [])[:writer_ids].map(&:to_i)
  end
end
