require 'rails_helper'

describe 'nagivate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @banner = FactoryGirl.create(:banner)
    end

    it 'has a status that can be edited on the form' do
      visit edit_banner_path(@banner)

      choose('banner_status_assigned')
      click_on "Save"

      expect(@banner.reload.status).to eq('assigned')
    end
  end
end