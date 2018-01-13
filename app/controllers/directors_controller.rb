class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order(:surname)
    @director = Director.new
  end

  def create
    @director = Director.new(director_attributes(Director))
    @director.save ? redirect_to(directors_path) : render('index')
  end

  def destroy
    authorize Director
    @director = Director.find(params[:id])
    if @director.movies.any?
      redirect_to @director.movies.last
    else
      @director.delete
      redirect_to directors_path
    end
  end
end
