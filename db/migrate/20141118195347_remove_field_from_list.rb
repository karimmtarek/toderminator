class RemoveFieldFromList < ActiveRecord::Migration
  def change
    remove_column :lists, :completed, :string
  end
end
