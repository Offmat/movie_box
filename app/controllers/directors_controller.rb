class DirectorsController < ApplicationController
  def create

  end

  def destroy

  end

  private

  def director_params
    params.require(:director).permit(:name, :surname)
  end
end
