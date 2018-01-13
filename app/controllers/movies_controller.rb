class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :authorize_movie, only: [:edit, :update, :destroy]

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
    @movie = Movie.new(permitted_attributes(Movie))
    @movie.user = current_user
    @movie.save ? redirect_to(@movie) : render('new')
  end

  def edit
  end

  def update
    @movie.update(permitted_attributes(Movie)) ? redirect_to(@movie) : render('edit')
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def authorize_movie
    authorize @movie
  end
end
