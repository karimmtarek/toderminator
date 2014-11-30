class TodoItem < ActiveRecord::Base
  belongs_to :list
  before_save :set_delete_on
  default_scope { order('delete_on') }


  RANGE = 1..7
  validates :name, presence: true, length: { minimum: 2 }
  validates :days_left, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 8 }
  #validates :days_left, #inclusion: {in: RANGE}

  def set_delete_on
    self.delete_on = self.days_left.day.from_now
  end

  def get_days_left
   (self.delete_on - self.created_at).round / 24.hours
  end
end
