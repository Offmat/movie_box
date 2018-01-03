class WritersController < ApplicationController
  def create

  end

  def destroy

  end

  private

  def writer_params
    params.require(:writer).permit(:name, :surname)
  end
end
