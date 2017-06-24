class Banner < ApplicationRecord
  enum status: {submitted: 0, assigned: 1, completed: 2, ops_qa: 3, product_qa: 4, completed: 5, rejected: 6 }
  belongs_to :user, optional: true
  validates_presence_of :start_date, :end_date, :location, :image
end
