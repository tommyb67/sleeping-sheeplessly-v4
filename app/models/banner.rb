class Banner < ApplicationRecord
  validates_presence_of :start_date, :end_date, :location, :image
end
