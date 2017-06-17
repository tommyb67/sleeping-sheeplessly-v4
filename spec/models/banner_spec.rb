require 'rails_helper'

RSpec.describe Banner, type: :model do
  describe "Creation" do
    before do
      @banner = FactoryGirl.create(:banner)
    end

    it "can be created" do
      expect(@banner).to be_valid
    end

    it "cannot be created without start_date end_date location and image" do
      @banner.start_date = nil
      @banner.end_date = nil
      @banner.location = nil
      @banner.image = nil
      expect(@banner).to_not be_valid
    end
  end
end
