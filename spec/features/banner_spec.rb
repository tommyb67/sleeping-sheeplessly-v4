require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit banners_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Banners' do
      visit banners_path
      expect(page).to have_content(/Banners/)
    end
  end

  describe 'creation' do
    before do
      visit new_banner_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form page' do

      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.tomorrow
      fill_in 'banner[location]', with: "Jumbotron 3"
      fill_in 'banner[headline]', with: "Let the sheep sleep!"
      fill_in 'banner[subcopy]', with: "Sheep baby sheep!"
      fill_in 'banner[image]', with: "D:/sleeping/images"

      click_on "Save"

      expect(page).to have_content("Let the sheep sleep!")
    end
  end
end