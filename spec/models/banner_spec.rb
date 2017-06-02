require 'rails_helper'

RSpec.describe Banner, type: :model do
  describe "Creation" do
    before do
      @banner = Banner.create(start_date: Date.today, end_date: Date.tomorrow, location: "jumbotron 1", headline: "Save 50% on all Sheeper Matresses", subcopy: "Buy now Sleep later!", image: "/images/sheeper.jpg")
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
