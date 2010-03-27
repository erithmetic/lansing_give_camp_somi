class CreateUserTimeBlocks < ActiveRecord::Migration
  def self.up
    create_table :user_time_blocks do |t|
			t.column :time_block_id, :integer
			t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :user_time_blocks
  end
end
