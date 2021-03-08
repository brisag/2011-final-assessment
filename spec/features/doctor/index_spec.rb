require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the Doctor index' do
    before(:each) do
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', practice: 11, university: 'Dartmouth')
      @doctor_3 = Doctor.create!(name: 'Jenny Lopez', practice: 2, university: 'Stanford')
      @doctor_2 = Doctor.create!(name: 'Leslie Owens', practice: 9, university: 'Boulder')
    end

    it 'Then I see the all Doctors including their name, years practiced, and university, ordered from most to least' do
      visit doctors_path
      # save_and_open_page
      expect(page).to have_content("All Doctors")

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content("Years of Practice: #{@doctor_1.practice}")
      expect(page).to have_content("University: #{@doctor_1.university}")

      expect(page).to have_content(@doctor_2.name)
      expect(page).to have_content("Years of Practice: #{@doctor_2.practice}")
      expect(page).to have_content("University: #{@doctor_2.university}")

      expect(page).to have_content(@doctor_3.name)
      expect(page).to have_content("Years of Practice: #{@doctor_3.practice}")
      expect(page).to have_content("University: #{@doctor_3.university}")
    end
  end
end
