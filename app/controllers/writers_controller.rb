class WritersController < ApplicationController
  def index
    @writers = Writer.all
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(writer_params)
    @writer.save ? redirect_to(writers_path) : render('index')
  end

  def destroy
    @writer = Writer.find(params[:id])
    if @writer.movies.any?
      redirect_to @writer.movies.last
    else
      @writer.delete
      redirect_to writers_path
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:name, :surname)
  end
end
