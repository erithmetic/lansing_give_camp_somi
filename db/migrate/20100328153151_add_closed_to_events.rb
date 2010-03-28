class AddClosedToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :closed, :boolean
  end

  def self.down
    remove_column :events, :closed
  end
end
