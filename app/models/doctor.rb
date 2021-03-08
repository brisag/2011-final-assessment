class Doctor < ApplicationRecord
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.order_by_expereince
    order(practice: :desc)
  end



  def self.average_experience
    average(:practice)
  end


  # def self.most_experience
  #   where(:practice > :average_experience)
  #
  # end
  #
  # def self.least_experience
  #   where(:practice < :average_experience)
  # end

  def self.search_name(name)
    find_by('name like ?', "%#{name}%")
  end
end
