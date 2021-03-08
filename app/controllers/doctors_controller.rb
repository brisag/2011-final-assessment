class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.order_by_expereince
    # binding.pry
  end

end
