class CreateEventVolunteers < ActiveRecord::Migration
  def self.up
    create_table :event_volunteers do |t|
			t.column :user_id, :integer, :null => false
			t.column :event_id, :integer, :null => false
			t.column :time_block_id, :integer
			t.column :created_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :event_volunteers
  end
end
