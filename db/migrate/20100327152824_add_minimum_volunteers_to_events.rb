class AddMinimumVolunteersToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :minimum_volunteers, :integer
  end

  def self.down
    remove_column :events, :minimum_volunteers
  end
end
