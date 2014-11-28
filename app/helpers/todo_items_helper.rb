module TodoItemsHelper
  def set_days_left(todo_item)
   (todo_item.delete_on - todo_item.created_at).round / (60*60*24)
  end
end
