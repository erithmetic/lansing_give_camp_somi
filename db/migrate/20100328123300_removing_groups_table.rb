class RemovingGroupsTable < ActiveRecord::Migration
  def self.up
    remove_column :users, :group_id
  end

  def self.down
  end
end
