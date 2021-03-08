class DoctorSurgeriesController < ApplicationController
  def create
    doctor = Doctor.search_name(params[:doctor_surgery][:name])
    surgery = Surgery.find(params[:doctor_surgery][:surgery_id])
    DoctorSurgery.create(doctor: doctor, surgery: surgery)
    redirect_to surgery_path(surgery)
  end
end
#   def create
#     # binding.pry
#     @doctor = Doctor.find(params[:doctor_id])
#     DoctorSurgery.create(doctor_id: (params[:doctor_id]), surgery_id: (params[:surgery_id]))
#     redirect_to doctor_path(@surgery)
#   end
# end
