require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a surgerys show page' do
    before(:each) do
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', practice: 12, university: 'Harvard ')
      @doctor_2 = Doctor.create!(name: 'Alex Karev', practice: 10, university: 'Johns Hopkins')
      @doctor_3 = Doctor.create!(name: 'Miranda Bailey', practice: 3, university: 'Stanford')

      @surgery_1 = Surgery.create!(title: 'Brain Surgery', day_of_week: 'Monday', room_number: 1)
      DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_1)
      DoctorSurgery.create!(doctor: @doctor_3, surgery: @surgery_1)

      @surgery_2 = Surgery.create!(title: 'Open Heart Surgery', day_of_week: 'Monday', room_number: 2)
      DoctorSurgery.create!(doctor: @doctor_2, surgery: @surgery_2)
      DoctorSurgery.create!(doctor: @doctor_3, surgery: @surgery_2)

      visit "/surgeries/#{@surgery_1.id}"

    end

    it 'has surgery title and op room number' do
      # visit surgery_path(@surgery_1)
      save_and_open_page
      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_1.room_number)
      expect(page).to have_content(@surgery_1.day_of_week)

    end

    # describe "I see two sections of experience" do
    #   it "And I see the names and years practiced of all doctors performing this surgery"
    #   # visit surgery_path(@surgery_1)
    #
    #   within('#most-expereinced') do
    #     expect(page).to have_content(@doctor_1.name)
    #     expect(page).to have_content("Years of Practice: #{@doctor_1.practice}")
    #   end
    #
    #   within('#least-expereinced') do
    #     expect(page).to have_content(@doctor_3.name)
    #     expect(page).to have_content("Years of Practice: #{@doctor_3.practice}")
    #   end
    # end
    it 'i can search by name to add existing doctors to the surgery' do
      visit surgery_path(@surgery_2)
        expect(page).to have_content('Add A Doctor To This Surgery')

        fill_in 'Name', with: 'Alex Karev'
        click_button 'Add to Surgery'

        expect(page).to have_content(@doctor_2.name)
      end
    end
  end
