class AddingIndexes < ActiveRecord::Migration
  def self.up
		add_index "event_volunteers", "event_id"
		add_index "event_volunteers", "user_id"
		add_index "user_time_blocks", "time_block_id"
		add_index "user_time_blocks", "user_id" 
  end

  def self.down
		remove_index :event_volunteers, :event_id
		remove_index :event_volunteers, :user_id
		remove_index :user_time_blocks, :time_block_id
		remove_index :user_time_blocks, :user_id
  end
end
