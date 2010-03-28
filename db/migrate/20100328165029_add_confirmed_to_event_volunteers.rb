class AddConfirmedToEventVolunteers < ActiveRecord::Migration
  def self.up
    add_column :event_volunteers, :confirmed, :boolean
  end

  def self.down
  end
end
