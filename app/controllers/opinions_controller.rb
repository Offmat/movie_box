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

  def destroy
    opinion = Opinion.find(params[:id])
    opinion.destroy

    redirect_to movie_path(params[:movie_id])
  end

  private

  def opinion_params
    params.require(:opinion).permit(:score, :comment)
  end
end
