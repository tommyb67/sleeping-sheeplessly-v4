require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit banners_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Banners' do
      expect(page).to have_content(/Banners/)
    end

    it 'has a list of banners' do
      banner1 = FactoryGirl.create(:banner)
      banner2 = FactoryGirl.create(:second_banner)
      visit banners_path
      expect(page).to have_content(/headline|Other headline/)
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

    it 'will have a user associated with the banner' do
      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.tomorrow
      fill_in 'banner[location]', with: "Jumbotron 3"
      fill_in 'banner[headline]', with: "Let the sheep sleep!"
      fill_in 'banner[subcopy]', with: "Sheep baby sheep!"
      fill_in 'banner[image]', with: "User Association"
      click_on "Save"

      expect(User.last.banners.last.image).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      @banner = FactoryGirl.create(:banner)
    end

    it 'can be reached by clicking edit on index page' do
      banner = FactoryGirl.create(:banner)
      visit banners_path

      click_link("edit_#{banner.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_banner_path(@banner)

      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.tomorrow
      fill_in 'banner[location]', with: "Jumbotron 3"
      fill_in 'banner[headline]', with: "Edited content"
      fill_in 'banner[subcopy]', with: "Sheep baby sheep!"
      fill_in 'banner[image]', with: "User Association"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end
  end
end