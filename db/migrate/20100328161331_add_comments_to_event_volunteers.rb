class AddCommentsToEventVolunteers < ActiveRecord::Migration
  def self.up
    add_column :event_volunteers, :comments, :string, :length => 500
  end

  def self.down
  end
end
