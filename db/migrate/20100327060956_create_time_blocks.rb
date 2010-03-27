class CreateTimeBlocks < ActiveRecord::Migration
  def self.up
    create_table :time_blocks do |t|
      t.string :description
      t.float :hours

      t.timestamps
    end

		create_table "events_time_blocks", :id => false do |t|
			t.column "event_id", :integer
			t.column "time_block_id", :integer
		end
		add_index "events_time_blocks", "event_id"
		add_index "events_time_blocks", "time_block_id"
  end

  def self.down
    drop_table :time_blocks
		drop_table "events_time_blocks"
  end
end
