class RemoveTimeBlockFromVolunteers < ActiveRecord::Migration
  def self.up
		remove_column :event_volunteers, :time_block_id
  end

  def self.down
		add_column :event_volunteers, :time_block_id, :integer
  end
end
