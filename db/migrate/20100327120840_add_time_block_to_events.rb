class AddTimeBlockToEvents < ActiveRecord::Migration
  def self.up
		add_column :time_blocks, :event_id, :integer
  end

  def self.down
		remove_column :time_blocks, :event_id
  end
end
