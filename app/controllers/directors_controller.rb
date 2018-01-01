class DirectorsController < ApplicationController
  def create
    @movie = Movie.find(params[:director][:movie_id])
    @director = Director.find_or_initialize_by(director_params)
    if @director.save
      MoviesDirector.new(movie: @movie, director: @director).save
      redirect_to edit_movie_path(@movie)
    else
      @writer = Writer.new
      render 'movies/edit'
    end
  end

  def destroy
    @director = Director.find(params[:id])
    MoviesDirector.find_by(movie_id: params[:movie_id], director: @director).destroy
    redirect_to edit_movie_path(params[:movie_id])
  end

  private

  def director_params
    params.require(:director).permit(:name, :surname)
  end
end
