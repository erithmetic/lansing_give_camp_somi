class AddAlternateToEventVolunteers < ActiveRecord::Migration
  def self.up
    add_column :event_volunteers, :alternate, :boolean
  end

  def self.down
  end
end
