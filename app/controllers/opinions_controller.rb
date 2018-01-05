class OpinionsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @opinion = Opinion.new(opinion_params)
    @opinion.attributes = {movie: @movie, user: current_user}
    if @opinion.save
      redirect_to @movie
    else
      render 'movies/show'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:score, :comment)
  end
end
