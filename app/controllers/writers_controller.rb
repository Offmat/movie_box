class WritersController < ApplicationController
  def index
    @writers = Writer.all.order(:surname)
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(writer_attributes(Writer))
    @writer.save ? redirect_to(writers_path) : render('index')
  end

  def destroy
    authorize Writer
    @writer = Writer.find(params[:id])
    if @writer.movies.any?
      redirect_to @writer.movies.last
    else
      @writer.delete
      redirect_to writers_path
    end
  end
end
