class OpinionsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @opinion = Opinion.new(opinion_attributes(Opinion))
    @opinion.attributes = {movie: @movie, user: current_user}
    if @opinion.save
      redirect_to @movie
    else
      render 'movies/show'
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    authorize @opinion
    @opinion.destroy

    redirect_to movie_path(params[:movie_id])
  end
end
