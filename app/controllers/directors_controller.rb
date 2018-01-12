class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order(:surname)
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    @director.save ? redirect_to(directors_path) : render('index')
  end

  def destroy
    @director = Director.find(params[:id])
    authorize @director
    if @director.movies.any?
      redirect_to @director.movies.last
    else
      @director.delete
      redirect_to directors_path
    end
  end

  private

  def director_params
    params.require(:director).permit(:name, :surname)
  end
end
