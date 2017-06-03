require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Bill", last_name: "Bixby")
      login_as(user, :scope => :user)
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
      banner1 = Banner.create(start_date: Date.today, end_date: Date.tomorrow, location: "Banner1", headline: "Banner1", subcopy: "Banner1", image: "/images/sheeper.jpg")
      banner2 = Banner.create(start_date: Date.today, end_date: Date.tomorrow, location: "Banner2", headline: "Banner2", subcopy: "Banner2", image: "/images/sheeper.jpg")
      visit banners_path
      expect(page).to have_content(/Banner1|Banner2/)
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
end