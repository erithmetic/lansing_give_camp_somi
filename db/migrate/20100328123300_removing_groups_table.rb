class RemovingGroupsTable < ActiveRecord::Migration
  def self.up
    drop_table :groups
    remove_column :users, :group_id
  end

  def self.down
  end
end
