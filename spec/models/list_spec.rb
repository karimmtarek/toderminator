require 'rails_helper'

RSpec.describe List, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "has a many to-do items" do
    item1 = TodoItem.create!(name: 'Item 1')
    item2 = TodoItem.create!(name: 'Item 2')
    item3 = TodoItem.create!(name: 'Item 3')

    list = List.create!(name: 'new list', todo_items:[item1, item2, item3])

    expect(list.reload.todo_items.count).to eq(3)
  end
end
