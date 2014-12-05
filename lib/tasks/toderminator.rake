namespace :toderminator do
  # include todo_items_helper
  desc "Delete todo item if days left are over"
  task :clean_up => :environment do
    todo_items = TodoItem.all
    todo_items.each do |todo_item|
      if todo_item.days_left_now <= 0
        puts "Cleaned item: #{todo_item.name} | days left: #{todo_item.days_left_now}."
        todo_item.destroy
      end
    end
    puts "Items daily clean-up is done: items left #{TodoItem.all.size}"
  end
end