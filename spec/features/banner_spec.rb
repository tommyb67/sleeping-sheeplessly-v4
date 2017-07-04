require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:banner) do
    Banner.create(start_date: Date.today, end_date: Date.tomorrow, location: 'Jumbotron 2', headline: 'headline', subcopy: 'subcopy', image: 'd://images', user_id: user.id)
  end

  before do
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
      banner1 = FactoryGirl.build_stubbed(:banner)
      banner2 = FactoryGirl.build_stubbed(:second_banner)
      visit banners_path
      expect(page).to have_content(/Headline|location/)
    end

    it 'has a scope so that only banners creators can see their banners' do
      other_user = User.create(first_name: "Non", last_name: "Authorized", email: "nonauth@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      banner_from_other_user = Banner.create(start_date: Date.today, end_date: Date.tomorrow, location: 'Jumbotron 2', headline: 'This banner should not be seen', subcopy: 'no schorning', image: 'd://images',user_id: other_user.id)

      visit banners_path

      expect(page).to_not have_content(/This banner should not be seen/)
    end
  end

  describe 'new' do
    it 'has a link from the index page' do
      visit banners_path

      click_link("new_banner_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do

      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)

      banner_to_delete = Banner.create(start_date: Date.today, end_date: Date.tomorrow, location: 'Jumbotron 2', headline: 'another headline', subcopy: 'no schorning', image: 'images', user_id: delete_user.id)

      visit banners_path

      click_link("delete_banner_#{banner_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)


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
    it 'can be edited' do
      visit edit_banner_path(banner)

      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.tomorrow
      fill_in 'banner[location]', with: "Jumbotron 3"
      fill_in 'banner[headline]', with: "Edited content"
      fill_in 'banner[subcopy]', with: "Sheep baby sheep!"
      fill_in 'banner[image]', with: "User Association"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_banner_path(banner)

      expect(current_path).to eq(root_path)
    end
  end
end