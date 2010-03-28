class AddCountToEventVolunteers < ActiveRecord::Migration
  def self.up
    remove_column :users, :count
    add_column :event_volunteers, :number_in_group, :integer
  end

  def self.down
    remove_column :event_volunteers, :number_in_group
  end
end
