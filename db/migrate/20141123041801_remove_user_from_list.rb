class RemoveUserFromList < ActiveRecord::Migration
  def change
    remove_column :lists, :User_id, :integer
  end
end
