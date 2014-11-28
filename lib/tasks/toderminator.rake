namespace :toderminator do
  desc "Delete todo item if days left are over"
  task :delete_item => :environment do
    todo_items = TodoItem.all
    todo_items.each do |todo_item|
      if days_left <= 0
        puts "Items: #{todo_item.name} | days_left: #{days_left} | JUST GOT DELETED."
        todo_item.destroy
      else
        puts "Item: #{todo_item.name} | days_left: #{days_left}"
      end
      # todo_item.destroy
    end
  end

  def days_left
    (todo_item.delete_on - todo_item.created_at).round / (60*60*24)
  end
end