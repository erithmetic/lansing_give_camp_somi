class RemoveTimeBlocks < ActiveRecord::Migration
  def self.up
    drop_table :time_blocks
    drop_table :user_time_blocks
  end

  def self.down
  end
end
