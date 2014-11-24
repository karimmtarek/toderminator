class List < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy

  validates :name, presence: true
  # validates_associated :todo_items
end
