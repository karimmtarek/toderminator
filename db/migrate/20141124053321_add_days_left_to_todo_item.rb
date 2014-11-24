class AddDaysLeftToTodoItem < ActiveRecord::Migration
  def change
    add_column :todo_items, :days_left, :integer
  end
end
