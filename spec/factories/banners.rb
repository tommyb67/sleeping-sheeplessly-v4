FactoryGirl.define do
  factory :banner do
    start_date Date.today
    end_date Date.tomorrow
    location "Some location"
    headline "headline"
    subcopy "Some subcopy"
    image "Some image"
    user
  end

  factory :second_banner, class: "Banner" do
    start_date Date.today
    end_date Date.tomorrow
    location "Some other location"
    headline "Other headline"
    subcopy "subcopy"
    image "Some other image"
    user
  end
end