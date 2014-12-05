class TodoItem < ActiveRecord::Base
  belongs_to :list
  default_scope { order('days_left') }

  RANGE = 1..7
  validates :name, presence: true, length: { minimum: 2 }
  validates :days_left, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 8 }

  def deadline
    created_at + days_left.days
  end

  def days_left_now
    (deadline - Time.now).round / 24.hours
  end
end
