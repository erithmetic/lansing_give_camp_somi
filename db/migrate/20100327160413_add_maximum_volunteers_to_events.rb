class AddMaximumVolunteersToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :maxiumum_volunteers, :integer
  end

  def self.down
    remove_column :events, :maxiumum_volunteers
  end
end
