class MoviesDirectorsController < ApplicationController
  def destroy
    movies_director = MoviesDirector.find_by(movie_id: params[:movie_id], director_id: params[:id])
    movies_director.destroy
    redirect_to edit_movie_path(params[:movie_id])
  end
end
