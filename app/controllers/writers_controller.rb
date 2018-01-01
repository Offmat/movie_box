class WritersController < ApplicationController
  def create
    @movie = Movie.find(params[:writer][:movie_id])
    @writer = Writer.find_or_initialize_by(writer_params)
    if @writer.save
      MoviesWriter.new(movie: @movie, writer: @writer).save
      redirect_to edit_movie_path(@movie)
    else
      @director = Director.new
      render 'movies/edit'
    end
  end

  def destroy
    @writer = Writer.find(params[:id])
    MoviesWriter.find_by(movie_id: params[:movie_id], writer: @writer).destroy
    redirect_to edit_movie_path(params[:movie_id])
  end

  private

  def writer_params
    params.require(:writer).permit(:name, :surname)
  end
end
