class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    # @doctors = Doctor.most_experience
    # @doctors = Doctor.least_experience
  end
end
