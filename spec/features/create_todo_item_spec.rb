require "rails_helper"

describe "When click create item" do
  it "creates a new todo item" do
    item1 = TodoItem.create!(name: 'Item 1')
    item2 = TodoItem.create!(name: 'Item 2')
    item3 = TodoItem.create!(name: 'Item 3')

    list = List.create!(name: 'A to do list', todo_items: [item1, item2, item3])

    visit list_path(list)
    expect(page).to have_text('Items:')
    click_link 'create new item'
  end

end