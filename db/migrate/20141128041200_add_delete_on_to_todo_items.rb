class AddDeleteOnToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :delete_on, :datetime
  end
end
