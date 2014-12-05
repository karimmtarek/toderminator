class RemoveDeleteOnFromTodoItem < ActiveRecord::Migration
  def change
    remove_column :todo_items, :delete_on, :datetime
  end
end
