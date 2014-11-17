class AddFieldToList < ActiveRecord::Migration
  def change
    add_reference :lists, :User, index: true
  end
end
