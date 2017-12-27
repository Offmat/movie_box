class DirectorsController < ApplicationController
  def create
    @movie = Movie.find(director_params[:movie_id])
    binding.pry
  end

  private

  def director_params
    params.require(:director).permit(:name, :surname, :movie_id)
  end
end
