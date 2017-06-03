class Banner < ApplicationRecord
  belongs_to :user
  validates_presence_of :start_date, :end_date, :location, :image
end
