task :check_item_for_delete => :environment do
  # user = User.find_by(email: 'karim@karimtarek.com')
  # list = user.lists
  todo_items = TodoItem.all
  todo_items.each do |todo_item|
    days_left = (todo_item.delete_on - todo_item.created_at).round / (60*60*24)
    if days_left <= 0
      puts "Items: #{todo_item.name} | days_left: #{days_left} | JUST GOT DELETED."
      todo_item.destroy
    else
      puts "Item: #{todo_item.name} | days_left: #{days_left}"
    end
    # todo_item.destroy
  end

end