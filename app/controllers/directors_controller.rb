class DirectorsController < ApplicationController
  def create
    @movie = Movie.find(params[:director][:movie_id])
    @director = Director.find_or_initialize_by(director_params)
    if @director.save
      MoviesDirector.new(movie: @movie, director: @director).save
      redirect_to @movie
    else
      render 'movies/show'
    end
  end

  private

  def director_params
    params.require(:director).permit(:name, :surname)
  end
end
