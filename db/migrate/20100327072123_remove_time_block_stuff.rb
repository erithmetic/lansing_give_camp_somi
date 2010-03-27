class RemoveTimeBlockStuff < ActiveRecord::Migration
  def self.up
		drop_table "events_time_blocks"
  end

  def self.down
		create_table "events_time_blocks", :id => false, :force => true do |t|
			t.integer "event_id"
			t.integer "time_block_id"
		end
  end
end
