class TodoItem < ActiveRecord::Base
  belongs_to :list

  RANGE = 1..7
  validates :name, presence: true
  validates :days_left, inclusion: {in: RANGE}
end
